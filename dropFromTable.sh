#!/bin/bash
PS3="${1}>>"


dropFromTable () {
read -p "Enter table name : " tname
if [ ! -z $tname ] && [ -f ./Databases/${1}/$tname ]
then
PK=`cut -d: -f2 ./Databases/${1}/$tname | head -n1`
deleteFlag=0
	read -p "Enter the value of PK (`cut -d: -f1 ./Databases/${1}/$tname | head -n1`) : " row
	
	touch ./Databases/tmp
	awk -F: '{if($"'$PK'"!="'$row'") print $0}' ./Databases/${1}/$tname >> ./Databases/tmp
	cat ./Databases/tmp > ./Databases/${1}/$tname
	rm ./Databases/tmp
if [ $deleteFlag -eq '1' ]
then
	echo "*******************Record with PK : $row has deleted successfuly!*******************"
else
	echo "*******************Record is not found!!*******************"
fi
else
	echo "Invalid table name!!"
fi	
}

dropFromTable ${1}
