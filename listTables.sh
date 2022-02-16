#!/bin/bash
source ./colors.sh
PS3="${1}>>"

clear
echo ""
echo -e "${BLUE}***********************************************${NOR}"
echo -e "${BLUE}******************   ${CYAN}Tables   ${BLUE}*****************${NOR}"
echo -e "${BLUE}***********************************************${NOR}"

i=0
for db in `ls $PWD/"Databases/${1}"`
    do
	i=$((i+1))
    echo -e "${BLUE}*   ${i}-\t ${NOR}$db"
done
echo -e "${BLUE}***********************************************${NOR}"



echo ""
echo -e "${BLUE}***********************************************"
echo -e "**************   ${CYAN}DML Operations   ${BLUE}*************"
echo -e "***********************************************${NOR}"

select choice in "Insert into table" "Drop from tables" "Select from table" "Back"  
do
case $REPLY in
	1) 	source ./insertTable.sh ${1}
		;;
	2) 	source ./dropFromTable.sh ${1}
		;;
	3)	source ./selectFromTable.sh ${1}
		;;
	4) 	echo -e "${BLUE}***********************************************${NOR}"
		source ./DBoperations.sh
		;;
	*) echo $REPLY "is not one of the choices."
		;;
esac
done
