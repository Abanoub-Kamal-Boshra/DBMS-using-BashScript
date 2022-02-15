#!/bin/bash
source ./colors.sh
PS3="Enter your choise number: "

echo ""
echo -e "${BLUE}***********************************************"
echo -e "****************   ${CYAN}Connecting   ${BLUE}***************"
echo -e "***********************************************${NOR}"

i=0
for db in `ls $PWD/"Databases"`
    do
	i=$((i+1))
    echo -e "${BLUE}*   ${i}-\t ${NOR}$db"
done
echo -e "${BLUE}***********************************************${NOR}"

select choice in "Continue" "Back"
do
case $REPLY in
	1) read -p "Enter Database name: " dbname
		if [ ! -z $dbname ] && [ -d ./Databases/$dbname ]
		then
			echo -e "\t${CYAN}$dbname ${GREEN}connected succesfully${NOR}"
			source ./DBoperations.sh $dbname
			
		else
			echo -e "\t${RED}Please enter an exist database name!${NOR}"
		fi
		;;
	2) echo -e "${BLUE}*******************************************************${NOR}"
	   source ./main.sh
		;;
	*) echo -e "\t${CYAN}$REPLY ${RED}is not one of the choices!${NOR}"
		;;
esac
done

