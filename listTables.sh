#!/bin/bash
PS3="${1}>>"
typeset -i i=0
for db in `ls $PWD/"Databases/${1}"`
    do
	i=$((i+1))
    echo -e "**\t${i} - $db\t**"
done

select choice in "Insert into table" "Drop from tables" "Select from table" "Back"  
do
case $REPLY in
	1) 	source ./insertTable.sh ${1}
		;;
	2) 	source ./dropFromTables.sh ${1}
		;;
	3)	source ./selectTable.sh ${1}
		;;
	4) source ./DBoperations.sh
		;;
	*) echo $REPLY "is not one of the choices."
		;;
esac
done
