#!/usr/bin/bash
PS3=$'\x1b[1;33m Please Enter the Table you want to update from the list >> \n\x1b[0m'

array=(`ls`)
select choice in ${array[*]}
do 
    if ! [[ "$REPLY" =~ ^[0-9]+$ ]]; then
        echo -e " \n\x1b[1;31m Please enter a valid numeric choice.\n\x1b[0m"
        continue
    elif [ "$REPLY" -gt "${#array[@]}" ]; then
        echo -e " \n\x1b[1;31m $REPLY Your Input Is Not Included In The  DataBase \n\x1b[0m"
        continue
    else
        echo -e " \n\x1b[1;34m You Selected the ${array[${REPLY}-1]} Table ...\n\x1b[0m"
        table_name=${array[${REPLY}-1]}
        # cat $table_name
        awk '{print $0}' $table_name
        break
    fi
done

# Handling User Input
read -p $'\e[1;33m\nEnter the id(pK) of the row you want to update: \n\e[0m' pK

# Read The Row want to update 
row=$(awk -F':' -v pK="$pK" '$1 == pK' "$table_name")

if grep -Fxq "$row" "$table_name" > /dev/null;
then 
    first_line=$(head -n 1 "$table_name")
    num_fields=$(awk -F: '{print NF -1}' <<< "$first_line")
    #echo "The number of fields in the first line of $table_name is: $num_fields"
    IFS=':' read -r -a arr <<< "$first_line"
    #printf '%s\n' "${arr[@]}"
    IFS=':' read -r -a data_types < <(sed -n '2p' "$table_name")
    #printf '%s\n' "${data_types[@]}"
    for ((i = 1; i < ${#arr[@]}; i++)); do
        # Prompt the user for the updated value
        while true 
        do
            read -p "Enter the updated value for ( ${arr[i]} ): " new_value
            
            case ${data_types[i]} in 
                integer )
                    if ! [[ $new_value =~ ^[0-9]+$ ]]; then
                        echo -e " \n\x1b[1;31m Error: ${arr[i]} must be an integer.\n\x1b[0m"
                    else
                        arr[i]=$new_value
                        break
                    fi
                    ;;
                string )
                    if ! [[ $new_value =~ ^[[:alpha:]]+$ ]]; then
                        echo -e " \n\x1b[1;31m Error: ${arr[i]} must be a string (letters only).\n\x1b[0m"
                    else
                        arr[i]=$new_value
                        break
                    fi 
                    ;;
            esac
        done
    done
    #printf '%s\n' "${arr[@]}"
    
    # Construct the updated line with the ID and the new values
    updated_line="$pK:$(IFS=:; echo "${arr[*]:1}")"
    
    # Replace the old line with the updated line in the file
    sed -i "s/^$row\$/$updated_line/" "$table_name"
    echo -e "\n\e[1;32m row updated suuccessfully\n\x1b[0m"
else
    echo -e "\n\e[1;31mid(pK) '$pK' doesn't exist please write valid id\e[0m"
    #cd ../../Application/updateTable.sh
fi