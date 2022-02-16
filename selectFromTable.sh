#!/bin/bash
source ./colors.sh

PS3="${1}>>"

echo ""
echo -e "${BLUE}**********   ${CYAN}Selecting from table   ${BLUE}***********${NOR}"

selectColumn () {

echo ""
echo -e "${BLUE}**************   ${CYAN}Select column   ${BLUE}***************${NOR}"

read -p "Enter table name: " tname
PK=`cut -d: -f2 ./Databases/${1}/$tname | head -n1`
if [ ! -z $tname ] && [ -f ./Databases/${1}/$tname ]
then
	read -p "Enter column name: " colname

	exist=`cat ./Databases/${1}/$tname | head -n2 | tail -n1 | grep "$colname."`
	if [ ! -z $exist ]
	then
		colnum=1
		while [ true ]
		do  
			fieldName=`cut -d: -f$colnum ./Databases/${1}/$tname | head -n2 | tail -n1 | cut -d. -f1`
			if [ $colname = $fieldName ]
			then
				break
			fi
			colnum=$((colnum+1))
		done

		echo ""
		echo -e "${BLUE}*******************${CYAN}   $tname   ${BLUE}********************${NOR}"
		cut -d: -f$colnum ./Databases/${1}/$tname | awk '{if(NR>1) print ":" $0 ": "}'| column -t -o"|" -s ":"
		echo -e "${BLUE}*************************************************${NOR}"
	else
		echo -e "\t${RED}Inavlid column name!${NOR}"
	fi
else
	echo -e "\t${RED}Invalid table name!${NOR}"
fi

echo ""
echo "1) Select table"
echo "2) Select record"
echo "3) Select column"
echo "4) Back"

}

selectRecord () {

echo ""
echo -e "${BLUE}*************   ${CYAN}Select recored   ${BLUE}**************${NOR}"

read -p "Enter table name: " tname
if [ ! -z $tname ] && [ -f ./Databases/${1}/$tname ]
then
	read -p "Enter column name: " colname

	exist=`cat ./Databases/${1}/$tname | head -n2 | tail -n1 | grep "$colname."`
	if [ ! -z $exist ]
	then
		colnum=1

		while [ true ]
		do  
			fieldName=`cut -d: -f$colnum ./Databases/${1}/$tname | head -n2 | tail -n1 | cut -d. -f1`
			if [ $colname = $fieldName ]
			then
				break
			fi
			colnum=$((colnum+1))
		done		

		read -p "Enter the $colname in this record: " search

		echo ""
		echo -e "${BLUE}*******************${CYAN}   $tname   ${BLUE}********************${NOR}"
		awk -F: '{if($"'$colnum'"=="'$search'" || NR==2) print "|"$0}' ./Databases/${1}/$tname | column -t -o"|" -s ":"
		echo -e "${BLUE}*************************************************${NOR}"
	else
		echo -e "\t${RED}Inavlid column name!${NOR}"
	fi
else
	echo -e "\t${RED}Invalid table name!${NOR}"
fi

echo ""
echo "1) Select table"
echo "2) Select record"
echo "3) Select column"
echo "4) Back"
}

selectTable () {

echo ""
echo -e "${BLUE}**************   ${CYAN}Select table   ${BLUE}***************${NOR}"

read -p "Enter table name : " tname
if [ ! -z $tname ] && [ -f ./Databases/${1}/$tname ]
then
	echo ""
	echo -e "${BLUE}*******************${CYAN}   $tname   ${BLUE}********************${NOR}"
	column -t -o"|" -s ":" ./Databases/${1}/$tname | awk '{if(NR>1) print "|" $0}'
	echo -e "${BLUE}*************************************************${NOR}"
fi

echo ""
echo "1) Select table"
echo "2) Select record"
echo "3) Select column"
echo "4) Back"
}



select choice in "Select table" "Select record" "Select column" "Back"  
do
case $REPLY in
	1) 	selectTable ${1}
		;;
	2) 	selectRecord ${1}
		;;
	3)	selectColumn ${1}
		;;
	4) 	source ./listTables.sh
		;;
	*) echo $REPLY "is not one of the choices."
		;;
esac
done


