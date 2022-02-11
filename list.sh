echo -e "********************************"
echo -e "=   ${BLUE}DataBases ${NC}   ="
echo -e "********************************"
    for db in `ls $PWD/"Databases"`
    do
    echo -e "\t$db"
    done
echo -e "********************************"
source ./main.sh
