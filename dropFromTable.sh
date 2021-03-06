#!/bin/bash
source ./colors.sh
PS3="${1}>>"

echo ""
echo -e "${BLUE}***********   ${CYAN}Dropping from table   ${BLUE}***********${NOR}"

dropFromTable () {
read -p "Enter table name: " tname
if [ ! -z $tname ] && [ -f ./Databases/${1}/$tname ]
then
	PK=`cut -d: -f2 ./Databases/${1}/$tname | head -n1`  		#pk column location
	linesNumAfter=0
	linesNumBefore=0
	read -p "Enter the value of PK (`cut -d: -f1 ./Databases/${1}/$tname | head -n1`): " row
	
	linesNumBefore=`cat ./Databases/${1}/$tname | wc -l`
	touch ./Databases/tmp
	awk -F: '{if($"'$PK'"!="'$row'") print $0}' ./Databases/${1}/$tname >> ./Databases/tmp
	cat ./Databases/tmp > ./Databases/${1}/$tname
	rm ./Databases/tmp

	linesNumAfter=`cat ./Databases/${1}/$tname | wc -l`
	if [[ $linesNumAfter != $linesNumBefore ]]
	then
		echo -e "\t${GREEN}Record with PK ${CYAN}$row ${GREEN}has deleted successfully.${NOR}"
		echo ""
	else
		echo -e "\t${RED}Record with PK ${CYAN}$row ${RED}does not found!${NOR}"		
		echo ""
	fi
else
	echo -e "\t${RED}Invalid table name!${NOR}"
	echo ""
fi

echo -e "${BLUE}***********************************************${NOR}"	
echo "1) Insert into table  3) Select from table"
echo "2) Drop from tables   4) Back"
}

dropFromTable ${1}
