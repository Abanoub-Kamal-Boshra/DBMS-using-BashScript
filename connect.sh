#!/bin/bash
PS3="Enter your choise: "
typeset -i i=0
for db in `ls $PWD/"Databases"`
    do
	i=$((i+1))
    echo -e "**\t${i} - $db\t**"
done

select choice in "Enter Database name" "Back"
do
case $REPLY in
	1) read dbname
		if [ ! -z $dbname ] && [ -d ./Databases/$dbname ]
		then
			./DBoperations.sh $dbname
			
		else
			echo "Please enter valid name"
			
		fi
		;;
	2) ./main.sh
		;;
	*) echo $REPLY "is not one of the choices."
		;;
esac
done
