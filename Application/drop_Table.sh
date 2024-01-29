PS3="Select the Table Number you want to Drop ... "
echo " ---- Select The Table Number From The Menu to Drop ---- " 
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
        rm ${array[${REPLY}-1]}
        echo -e " \n\x1b[1;32m ${array[${REPLY}-1]} Table is dropped successfully \n\x1b[0m"
        break
    fi
done