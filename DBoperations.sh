#!/bin/bash
source ./colors.sh
PS3="${1}>>"

echo ""
echo -e "${BLUE}***********************************************"
echo -e "**************   ${CYAN}DDL Operations   ${BLUE}*************"
echo -e "***********************************************${NOR}"


select choice in "Create table" "List tables" "Drop table" "To main menu"  
do
case $REPLY in
	1) 	source ./createTable.sh ${1}
		;;
	2) 	source ./listTables.sh ${1}
		;;
	3)	source ./dropTable.sh ${1}
		;;
	4) 	echo -e "${BLUE}*******************************************************${NOR}"
		source ./main.sh
		;;
	*) 	
		echo -e "${CYAN}$REPLY ${RED}is not one of the choices!${NOR}"
		;;
esac
done
