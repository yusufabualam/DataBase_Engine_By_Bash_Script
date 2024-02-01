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



# ========== (2) let the user insert into the table    ========

let num_fields=$(head -1 "$table_name" | awk -F: '{print NF}')
row=""

for ((i=1; i<$num_fields; i++))
do
    echo "insert field num $i"
    read field
    # validate the field num
    row+="$field:"
done

echo "$row" >> "$table_name"
echo "you inserted your data successfully"


cd - &> /dev/null 2>&1 