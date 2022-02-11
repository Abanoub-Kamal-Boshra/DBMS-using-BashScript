#!/bin/bash
PS3="Enter the number of your choise: "
createdb(){
    if [ ! -d ./Databases/ ]
    then
    mkdir ./Databases
    fi
    echo -e "=========================================="
    echo -e "#           ${BLUE}create Database${NC}              #"
    echo -e "=========================================="
while [[ true ]]
do
    read -p "Enter database name : " dbName
        if [ "$dbName" == '' ]
        then
            echo -e "*======${RED}Please Enter Valid Data${NC}======*"
        
        elif [ -d ./Databases/$dbName ]
        then
            echo -e "*======${RED}Database already Exist${NC}======*"
        else
            mkdir ./Databases/$dbName
            echo ""
            echo  -e "\t${GREEN}Database  $dbName succesfully created${NC}"
            break
        fi
done
}
echo -e "*=========${CYAN}Do You Need To Create More DataBases${NC}==========*"

     select type in 'Yes' 'No'
     do 
        case $REPLY in
           
           1) createdb
            ;;   
            
           2) ./main.sh
            ;;
       
    esac
    done


