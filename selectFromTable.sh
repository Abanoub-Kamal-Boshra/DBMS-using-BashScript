#!/bin/bash
PS3="${1}>>"
PK=`cut -d: -f2 ./Databases/${1}/$tname | head -n1`

selectColumn () {
read -p "Enter table name : " tname
if [ ! -z $tname ] && [ -f ./Databases/${1}/$tname ]
then
	read -p "Enter column name : " colname

	exist=`cat ./Databases/${1}/$tname | head -n2 | tail -n1 | grep "$colname."`
	if [ ! -z $exist ]
	then
		colnum=1
		while [ true ]
		do  
			fieldName=`cut -d: -f$colnum ./Databases/${1}/$tname | head -n2 | tail -n1 | cut -d. -f1`
			if [ $colname = $fieldName ]
			then
				break
			fi
			colnum=$((colnum+1))
		done

		echo -e "**********************\t$tname\t***********************"
		cut -d: -f$colnum ./Databases/${1}/$tname | awk '{if(NR>1) print ":" $0 ": "}'| column -t -o"|" -s ":"
		echo -e "*******************************************************"
	else
		echo "Inavlid column name!!"
	fi
else
	echo "Invalid table name!!"
fi
}

selectRecord () {
read -p "Enter table name : " tname
if [ ! -z $tname ] && [ -f ./Databases/${1}/$tname ]
then
	read -p "Enter column name : " colname

	exist=`cat ./Databases/${1}/$tname | head -n2 | tail -n1 | grep "$colname."`
	if [ ! -z $exist ]
	then
		colnum=1

		while [ true ]
		do  
			fieldName=`cut -d: -f$colnum ./Databases/${1}/$tname | head -n2 | tail -n1 | cut -d. -f1`
			if [ $colname = $fieldName ]
			then
				break
			fi
			colnum=$((colnum+1))
		done		

		read -p "Enter $colname : " search

		echo -e "**********************\t$tname\t***********************"
		awk -F: '{if($"'$colnum'"=="'$search'" || NR==2) print "|"$0}' ./Databases/${1}/$tname | column -t -o"|" -s ":"
		echo -e "*******************************************************"
	else
		echo "Inavlid column name!!"
	fi
else
	echo "Invalid table name!!"
fi
}

selectTable () {
read -p "Enter table name : " tname
if [ ! -z $tname ] && [ -f ./Databases/${1}/$tname ]
then
	echo -e "**********************\t$tname\t***********************"
	column -t -o"|" -s ":" ./Databases/${1}/$tname | awk '{if(NR>1) print "|" $0}'
	echo -e "*******************************************************"
fi
}

select choice in "Select table" "Select record" "Select column" "Back"  
do
case $REPLY in
	1) 	selectTable ${1}
		;;
	2) 	selectRecord ${1}
		;;
	3)	selectColumn ${1}
		;;
	4) source ./listTables.sh
		;;
	*) echo $REPLY "is not one of the choices."
		;;
esac
done


