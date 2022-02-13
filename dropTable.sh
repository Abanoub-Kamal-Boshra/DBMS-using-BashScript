#!/bin/bash
PS3="${1}>>"
read -p "Enter the name of table you want to drop : " tname

if [ ! -f ./Databases/${1}/$tname ]
then
	echo "Table ($tname) does not exist!!"
else
	rm ./Databases/${1}/$tname
	echo -e "\t********$tname has removed successfully!\t********"
fi

