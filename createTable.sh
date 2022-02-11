#!/bin/bash
PS3="${1}>>"
read -p "Please enter table name" tname
if [ ! -z tname ] && [ ! -d ./Databases/${1}/tname ]
then
	select choice in "New column" "Finish table"  
	do
	case $REPLY in
		1) 
			echo "ok"
 #createTable.sh
			;;
		2) 	#enter PK
			./DBoperations.sh ${1}
			;;
		*) echo $REPLY "is not one of the choices."
			;;
	esac
	done
fi

createColumn()
{
	read -p "Enter number of columns : " cnum
	
}
