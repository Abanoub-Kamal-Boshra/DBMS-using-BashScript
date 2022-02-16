#!/bin/bash
source ./colors.sh

PS3="Enter your choise number: "
clear
echo " "
echo -e "${BLUE}\t***********************************************"
echo -e "\t****************\t${RED}DBMS${BLUE}\t***************"
echo -e "\t***********************************************${NOR}"
echo " "
select choice in "Create Database" "List Databases"  "Connect To Databases" "Drop Database" "Exit"
do
case $REPLY in
	1) source ./createDB.sh
		;;
	2) source ./list.sh
		;;
	3) source ./connect.sh
		;;
	4) source ./dropDatabase.sh
		;;
	5) exit
		;;
	*) echo $REPLY "is not one of the choices."
		exit
		;;
esac
done
