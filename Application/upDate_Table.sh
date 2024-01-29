#!/usr/bin/bash

array=(`ls`)
select choice in ${array[*]}
do 
    if ! [[ "$REPLY" =~ ^[0-9]+$ ]]; then
        echo -e " \n\x1b[1;36m Please enter a valid numeric choice.\n\x1b[0m"
        continue
    elif [ "$REPLY" -gt "${#array[@]}" ]; then
        echo -e " \n\x1b[1;36m $REPLY Your Input Is Not Included In The  DataBase \n\x1b[0m"
        continue
    else
        echo -e "You Selected the ${array[${REPLY}-1]} Table ..."
        table_name=${array[${REPLY}-1]}
        break
    fi
done

# Handling User Input
read -p "Enter the id(pK) of row: " pK

# Reading Column Names
columns=`head -1 "$table_name" | awk 'BEGIN{ RS = ":";}' '{print $1}'`

# Read The Row want to update 
row=`awk -F':' '{ if($1=='$pK') print $0}' $table_name`

# Checking the validation of pK
if grep -Fxq "$row" "$table_name" > /dev/null;
then 
    # Check Number of Fields
    let num_fields=`head -1 $table_name | awk -F: '{print NF}'`
    arr=()
    for col in $columns
    do
    arr+=($col)
    done 
    # Print Field name and get values from user 
    for ((i=1;i<num_fields-1;i++))
    do
    read -p "Enter Value of (${arr[$i]}): " field
    userVal+=$field
    done
    # Update the row in the file
    sed -i 's/'$row'/'$pK":"$userVal'/' $table_name
    echo "row updated suuccessfully"

else
    echo "id(pK) '$pK' doesn't exist please write valid id"
    ../../Application/upDate_Table.sh
fi