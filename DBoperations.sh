#!/bin/bash
PS3="${1}>>"
select choice in "Create table" "List tables" "Drop table" "To main menu"  
do
case $REPLY in
	1) 	source ./createTable.sh ${1}
		;;
	2) 	source ./listTables.sh ${1}
		;;
	3)	source ./dropTable.sh ${1}
		;;
	4) source ./main.sh
		;;
	*) echo $REPLY "is not one of the choices."
		;;
esac
done
