#!/bin/bash
source ./colors.sh

shopt -s extglob
export 	LC_COLLATE=C
PS3="${1}>>"

echo ""
echo -e "${BLUE}**********   ${CYAN}Inserting into table   ${BLUE}***********${NOR}"

read -p "Enter table name: " tname

if [ ! -f ./Databases/${1}/$tname ]
then
	echo -e "\t${RED}Invalid table name!${NOR}"
	echo ""
else

	PK=`cut -d: -f2 ./Databases/${1}/$tname | head -n1`
	limiter=`cut -d: -f3 ./Databases/${1}/$tname | head -n1`
	#echo $limiter
	record=""
	let nLines=`cat ./Databases/${1}/$tname | wc -l`-2

	for (( i=1; i<limiter; i++ ))
	do  
		fieldName=`cut -d: -f$i ./Databases/${1}/$tname | head -n2 | tail -n1 | cut -d. -f1`
		fieldType=`cut -d: -f$i ./Databases/${1}/$tname | head -n2 | tail -n1 | cut -d. -f2`

		while [ true ]
		do
			read -p "Enter $fieldName: " input

			if [ $PK -eq $i ] && [ ! -z `cut -d: -f$i ./Databases/${1}/$tname | tail -n$nLines | grep $input` ]
			then
				echo -e "\t${RED}This primary key already exists!${NOR}"
				echo -e "\t${RED}It must be unique....re-enter again.${NOR}"
				continue
			fi

			if [ -z $input ]
			then 
				echo -e "\t${RED}Invalid input...re-enter agian!${NOR}"
			elif [ $fieldType = "number" ]
			then	
				case $input in
				+([0-9])) break
					;;
				*) echo -e "\t${RED}You must enter a number....re-enter again: ${NOR}"
					;;
				esac
			else
				break
			fi
		done		

		record="$record$input:"
		#echo $input
	done

	echo  "$record " >> ./Databases/${1}/$tname

fi

echo ""
echo -e "${BLUE}***********************************************${NOR}"
echo "1) Insert into table  3) Select from table"
echo "2) Drop from tables   4) Back"
