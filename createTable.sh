#!/bin/bash
source ./colors.sh
PS3="${1}>>"


shopt -s extglob
export LC_COLLATE=C

pk_flag=0
primaryKey=""
colNum=1
record=""


createColumn()
{

	read -p "Enter the column name: " col
	
	if [ ! -z $col ] && [[ $col =~ ^[a-zA-Z] ]]
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
				*) echo -e "\t${RED}Enter a valid column name!${NOR}"
					;;
			esac
			done
		fi
		echo "Select the column data type: "
		select choice in "Number" "String"
		do
			case $REPLY in
				1) record="$record$col.number:"
				   break
					;;
				2) record="$record$col.text:"
				   break
				   	;;
				*) echo -e "\t${RED}Enter a valid type${NOR}"
					;;
			esac
		done

		let counter=$counter+1

		let colNum=$colNum+1   #
		echo -e "\t${GREEN}column created sucessfully.${NOR}"
	else
		echo -e "\t${RED}Invalid column name!${NOR}"
	fi
	
	echo ""
	echo -e "${BLUE}***********************************************${NOR}"
	echo "1) New column"
	echo "2) Finish table"
	echo "3) Unsave table"
}


read -p "Please enter table name: " tname

if [[ $tname =~ ^[a-zA-Z] ]] && [[ ! -f ./Databases/${1}/$tname ]]; 
then
	touch ./Databases/${1}/$tname
	echo -e "\t${CYAN}$tname ${GREEN}table has created successfully${NOR}"	
	
	echo ""
	echo -e "${BLUE}*************   ${CYAN}Creating table   ${BLUE}************${NOR}"
	select choice in "New column" "Finish table" "Unsave table"
	do
	case $REPLY in
		1) 	createColumn ${1} $tname
			;;
		2) 
			if [ "$pk_flag" != "0" ]
			then
				echo -e "$primaryKey:$colNum\n$record" >> ./Databases/${1}/$tname
				echo -e "\t${CYAN}$tname ${GREEN}table has created sucessfully.${NOR}"
				echo -e "${BLUE}***********************************************${NOR}"
				source ./DBoperations.sh ${1}
			else
				echo -e "\t${RED}You must enter a Primary Key Column${NOR}"
			fi
			;;
		3) 	rm ./Databases/${1}/$tname
			echo -e "\t${CYAN}$tname ${GREEN}table has unsaved.${NOR}"
			echo -e "${BLUE}***********************************************${NOR}"
			source ./DBoperations.sh
			;;
		*) 	echo -e "\t${CYAN}$REPLY ${RED}is not one of the choices!${NOR}"
			;;
	esac
	done
else
	#clear
	echo -e "\t${RED}Invalid table name or already exists!${NOR}"
	echo ""
	source ./DBoperations.sh
fi



