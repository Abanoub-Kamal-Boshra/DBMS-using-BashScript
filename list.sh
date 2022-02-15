#!/bin/bash
source ./colors.sh
echo ""
echo -e "${BLUE}***********************************************"
echo -e "****************   ${CYAN}DataBases   ${BLUE}****************"
echo -e "***********************************************${NOR}"
    i=0
    for db in `ls $PWD/"Databases"`
    do
	i=$((i+1))
	echo -e "${BLUE}*   ${i}-\t ${NOR}$db"
    done
echo -e "${BLUE}*******************************************************${NOR}"
echo ""
source ./main.sh
