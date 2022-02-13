#!/bin/bash
PS3="Enter your choise: "

for db in `ls $PWD/"Databases"`
    do
	i=$((i+1))
    echo -e "**\t${i} - $db\t**"
done

read -p "Enter the name of table you want to drop : " dbname

if [ ! -d ./Databases/$dbname ]
then
	echo "Database ($dbname) does not exist!!"
else
	rm -r ./Databases/$dbname
	echo -e "\t********$dbname has removed successfully!\t********"
fi

source ./main.sh
