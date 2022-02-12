#!/bin/bash
#source ./createDB.sh
RED='\033[0;31m'
GREEN='\033[00;32m'
YELLOW='\033[01;33m'
BLUE='\e[34m'
CYAN='\e[36m'
NOR='\033[0m'
PS3="Enter your choise: "
echo " "
echo -e "${BLUE}\t***********************************************"
echo -e "\t****************\t${RED}DBMS${BLUE}\t***************"
echo -e "\t***********************************************${NOR}"
echo " "
select choice in "Create Database" "List Databases"  "Connect To Databases" "Drop Database" "Exit"
do
case $REPLY in
	1) ./createDB.sh
		;;
	2) ./list.sh
		;;
	3) ./connect.sh
		;;
	4) ./dropDB.sh
		;;
	5) exit
		;;
	*) echo $REPLY "is not one of the choices."
		exit
		;;
esac
done
