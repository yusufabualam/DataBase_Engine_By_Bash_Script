#!/usr/bin/bash



echo "
-----> Select your table number that you want to  insert into <--------
"
array=(`ls`)
# echo ${#array[*]}

select choice in  ${array[*]}
do
	if [ $REPLY -gt ${#array[*]} ]
	then
		echo "
		$REPLY is not on the menu
		"
		continue
	else
		echo "
		... You selected ${array[${REPLY}-1]} Table...
		"
			table_name=${array[${REPLY}-1]} 
		break 
	fi
done	



let num_fields=`head -1 $table_name | awk -F: '{print NF}'`

for ((i=1;i<$num_fields;i++))
do
	
	echo "insert filed num $i"
	read field

	row+=$field:
done
echo $row >> $table_name
echo "the data inserted Sucssuflly"