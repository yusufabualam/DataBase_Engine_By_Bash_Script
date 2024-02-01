#!/usr/bin/bash

echo -e "\e[1;34m
-----  Select The Number Of The Table --------
\e[0m"
array=(`ls`)

select choice in ${array[*]}
do
    case $REPLY in
        ''|*[!0-9]*) # Check if it's empty or contains non-numeric characters
            echo -e "\e[1;31mInvalid input. Please enter a valid table number.\e[0m"
            continue
            ;;
        *)
            if [ $REPLY -gt ${#array[*]} ]; then
                echo -e "\e[1;31m$REPLY Is Not A Table\e[0m"
                continue
            elif [[ $REPLY -eq 0 || ! "$REPLY" =~ ^[1-9]+$ ]]; then
                echo -e "\e[1;33mDo you want to exit from Insert_IN_Table? (Y/N)\e[0m"
                read -r exit_choice
                case $exit_choice in
                    [Yy])
                        echo -e "\e[1;31mExiting from Insert_IN_Table.\e[0m"
                        exit 0
                        ;;
                    [Nn])
                        echo -e "\e[1;31mContinuing with table selection.\e[0m"
						array=(`ls`)
                        continue
                        ;;
                    *)
                        echo -e "\e[1;31mInvalid choice. Continuing with table selection.\e[0m"
                        continue
                        ;;
                esac
            else
                 echo -e "\n\e[1;32m .. You Selected ${array[${REPLY}-1]} Table...\n\e[0m"
                table_name=${array[${REPLY}-1]}
                break
            fi
            ;;
    esac
done




# Get the number of fields from the first row
num_fields=$(head -1 "$table_name" | awk -F: '{print NF}')

# Initialize an array to store primary key values
declare -A primary_keys

# Loop through the fields starting from the third field
for ((i=3; i<=$num_fields; i++))
do
    echo "Insert data for Field num $i"
    read -p "Enter value for Field $i: " field

    # Check if the primary key value is already used
    while [ -n "${primary_keys["$field"]}" ]
    do
        echo "Error: Primary key must be unique. Value '$field' is already used."
        read -p "Enter a different value for Field $i: " field
    done

    # Store the primary key value in the array
    primary_keys["$field"]=1

    # Append the field value to the row
    row+="$field:"
done

# Remove the trailing colon from the row
row=${row%:}

# Append the row to the table file
echo "$row" >> "$table_name"

echo "Data inserted successfully."

cd - &> /dev/null 2>&1 