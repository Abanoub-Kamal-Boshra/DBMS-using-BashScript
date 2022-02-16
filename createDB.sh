#!/bin/bash
source ./colors.sh
PS3="Enter your choise number: "

shopt -s extglob
export 	LC_COLLATE=C

createdb(){
    if [ ! -d ./Databases/ ]
    then
    mkdir ./Databases
    fi

	echo " "
	echo -e "${BLUE}***********************************************"
	echo -e "************\t${CYAN}create Database${BLUE}    ************"
	echo -e "***********************************************${NOR}"

while [[ true ]]
do
    read -p "Enter database name : " dbName
        if [ -z $dbName ] || [[ $dbName != +([a-zA-Z0-9]) ]] || [[ $dbName =~ ^[0-9] ]]
        then
            echo -e "\t${RED}Please enter a valid data!${NOR}"
        
        elif [ -d ./Databases/$dbName ]
        then
            echo -e "\t${RED}Database already exist!${NOR}"
       else
            mkdir ./Databases/$dbName
	    clear
            echo ""
            echo  -e "\t${GREEN}Database ${CYAN}$dbName ${GREEN}succesfully created${NOR}"
	    echo ""
            break
        fi
done


echo " "
echo -e "${BLUE}***** ${CYAN}Do You Need To Create More DataBases${BLUE} *****${NOR}"

     select type in 'Yes' 'No'
     do 
        case $REPLY in
           
           1) createdb
            ;;   
            
           2) echo -e "${BLUE}*******************************************************${NOR}"
	      source ./main.sh
            ;;
       
    esac
    done
}

createdb


