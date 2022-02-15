#!/bin/bash

PS3="Enter your choise number from drop: "

  if [ ! -d ./Databases/ ]
    then
    mkdir ./Databases
    fi
    echo -e "=========================================="
    echo -e "#            ${BLUE}Drop Database${NC}               #"
    echo -e "=========================================="
while [[ true ]]
do
    read -p "Enter database name to drop: " dbName
        if [ "$dbName" == '' ]
        then
            echo -e "\t${GREEN}Inbalide input${NC}" 
        
        elif [[ ! -d ./Databases/$dbName ]]
        then
	    echo  -e "\t${GREEN}Database  $dbName is not exist${NC}"           
        else
            echo ""
	    rm -r ./Databases/$dbName 
	    echo -e "*======${RED} Database dropped succefully ${NC}======*"
            break
        fi
done

echo " "
echo -e "*=========${CYAN} Do You Need To Drop More DataBases ${NC}==========*"

     select type in 'Yes' 'No'
     do 
        case $REPLY in
           
           1) dropdb
            ;;   
            
           2) ./main.sh
            ;;
       
    esac
    done



