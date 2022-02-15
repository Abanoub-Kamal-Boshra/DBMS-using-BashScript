#!/bin/bash
source ./colors.sh
PS3="${1}>>"

echo ""
echo -e "${BLUE}*************   ${CYAN}Dropping table   ${BLUE}**************${NOR}"


read -p "Enter the name of table you want to drop : " tname

if [ ! -f ./Databases/${1}/$tname ]
then
	echo -e "\t${CYAN}$tname ${RED}table does not exist!${RED}"
else
	rm ./Databases/${1}/$tname
	echo -e "\t${CYAN}$tname ${GREEN}table has removed successfully.${NOR}"
fi

echo ""
echo -e "${BLUE}***********************************************${NOR}"
source ./DBoperations.sh
