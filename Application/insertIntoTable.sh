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
                 echo -e "\n\e[1;32m .. Note That  The Insertion Started From The Third RoW ...\n\e[0m"
                table_name=${array[${REPLY}-1]}
                break
            fi
            ;;
    esac
done










# ========== (1) let the user insert in the  the table    ========

num_fields=$(head -1 "$table_name" | awk -F: '{print NF}')
row=""

for ((i=1; i<=$num_fields; i++))
do
    # Special case for the first column
    if [ $i -eq 1 ]; then
        echo "Insert value for the first column (field number $i):"
        read field
        if field == cut 

        # Check if the value already exists in the first column of previous rows
        while grep -q "^$field:" "$table_name"; do
            echo "Error: Value in the first column must be unique. Value '$field' already exists."
            echo "Re-enter value for the first column (field number $i):"
            read field
        done

    else
        echo "Insert value for field number $i:"
        read field
    fi

    # Append the field to the row
    row+="$field:"
done

# Append the row to the table
echo $row >> "$table_name"
echo -e "\n\e[1;32m .. You Inserted The Data Successfully ...\n\e[0m"

cd - &> /dev/null 2>&1