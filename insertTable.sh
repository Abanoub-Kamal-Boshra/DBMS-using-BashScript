#!/bin/bash
shopt -s extglob
export 	LC_COLLATE=C
PS3="${1}>>"

read -p "Enter table name : " tname

if [ ! -f ./Databases/${1}/$tname ]
then
	echo "Invalid table name"
else

PK=`cut -d: -f2 ./Databases/${1}/$tname | head -n1`
limiter=`cut -d: -f3 ./Databases/${1}/$tname | head -n1`
echo $limiter
record=""
let nLines=`cat ./Databases/${1}/$tname | wc -l`-2

for (( i=1; i<limiter; i++ ))
do  
	fieldName=`cut -d: -f$i ./Databases/${1}/$tname | head -n2 | tail -n1 | cut -d. -f1`
	fieldType=`cut -d: -f$i ./Databases/${1}/$tname | head -n2 | tail -n1 | cut -d. -f2`

	while [ true ]
	do
		read -p "Enter $fieldName : " input

		if [ $PK -eq $i ] && [ ! -z `cut -d: -f$i ./Databases/${1}/$tname | tail -n$nLines | grep $input` ]
		then
			echo "This primary key already exists!! It must be unique....re-enter again."
			continue
		fi

		if [ -z $input ]
		then 
			echo "Invalid input...re-enter agian!!"
		elif [ $fieldType = "number" ]
		then	
			case $input in
			+([0-9])) break
				;;
			*) echo "You must enter a number....re-enter again : "
				;;
			esac
		else
			break
		fi
	done		



	record="$record$input:"
	echo $input


done

echo  "$record " >> ./Databases/${1}/$tname


fi
