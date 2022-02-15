#!/bin/bash
source ./colors.sh
PS3="Enter your choise number: "

echo ""
echo -e "${BLUE}***********************************************"
echo -e "*****************   ${CYAN}Dropping   ${BLUE}****************"
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
	1) read -p "Enter the database name you want to drop: " dbname

	   if [ ! -d ./Databases/$dbname ]
	   then
		echo -e "\t${RED}Database ${CYAN}($dbname) ${RED}does not exist!${NOR}"
	   else
		rm -r ./Databases/$dbname
		echo -e "\t${CYAN}$dbname ${GREEN}has removed successfully${NOR}"
	   fi
			;;
	2) echo -e "${BLUE}*******************************************************${NOR}"
	   source ./main.sh
		;;
	*) echo -e "\t${CYAN}$REPLY ${RED}is not one of the choices!${NOR}"
		;;
esac
done
