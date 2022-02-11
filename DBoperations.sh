#!/bin/bash
PS3="${1}>>"
select choice in "Create table" "List tables" "Drop table" "To main menu"  
do
case $REPLY in
	1) 	./createTable.sh ${1}
		;;
	2) 	echo "ok"
		;;
	3)	echo "ok"
		;;
	4) ./main.sh
		;;
	*) echo $REPLY "is not one of the choices."
		;;
esac
done
