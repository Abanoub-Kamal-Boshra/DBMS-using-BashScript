#!/bin/bash
PS3="${1}>>"

pk_flag=0
primaryKey=""
colNum=1


createColumn()
{
	
	read -p "Enter column name : " col
	
	if [ ! -z col ]
	then
		if [ "$pk_flag" = "0" ]
		then
			select choice in "Is Primary Key" "No"
			do
			case $REPLY in
				1) primaryKey="$col:$colNum"
				   pk_flag="1"
				   break
					;;
				2) break
				   	;;
			esac
			done
		fi
		echo "Enter column data"
		select choice in "Number" "String"
		do
			case $REPLY in
				1) record="$record$col.number:"
				   break
					;;
				2) record="$record$col.text:"
				   break
				   	;;
				*) echo "Enter a valid type"
					;;
			esac
		done
	else
		echo "Enter a valid column name!"
	fi
	
	let colNum=$colNum+1
}



read -p "Please enter table name : " tname
if [ ! -z $tname ] && [ ! -f ./Databases/${1}/$tname ]
then
	touch ./Databases/${1}/$tname

	select choice in "New column" "Finish table" "Unsave table"
	do
	case $REPLY in
		1) 	createColumn
			echo "ok"
			;;
		2) 
			if [ "$pk_flag" != "0" ]
			then
				NL=$'\n'
				echo -e "$primaryKey:$colNum\n$record " >> ./Databases/${1}/$tname
				./DBoperations.sh ${1}
			else
				echo "You must enter a Primary Key Column"
			fi
			;;
		3) 	rm ./Databases/${1}/$tname
			source ./DBoperations.sh
			;;
		*) echo $REPLY "is not one of the choices."
			;;
	esac
	done
else
	echo "Invalid table name or already exists!!"
fi













