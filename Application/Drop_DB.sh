#!/bin/bash

cd ../Data

PS3=$'\x1b[1;33m Type The Database Number you want to drop ... \n\x1b[0m'

echo -e "\n\x1b[1;36m -------- Which Database Do You Want To Drop -------- \n\x1b[0m"

array=( $(ls -F | grep / | tr / " ") )

select choice in "${array[@]}"; do
    if ! [[ "$REPLY" =~ ^[0-9]+$ ]]; then
        echo -e " \n\x1b[1;36m Please enter a valid numeric choice.\n\x1b[0m"
        continue3
    elif [ "$REPLY" -gt "${#array[@]}" ]; then
        echo -e " \n\x1b[1;36m $REPLY Your Input Is Not Included In The  DataBase \n\x1b[0m"
        continue
    else
        selected_database="${array[${REPLY} - 1]}"

        # Validate the selected database name
        if [[ ! "$selected_database" =~ ^[a-zA-Z0-9_]+$ ]]; then
            echo -e "\x1b[1;31m ERROR: Invalid characters in database name.\x1b[0m"
            break
        fi

        echo -e "\x1b[1;34m.... You Are In ${selected_database} Database...\x1b[0m"

        # Check if the directory contains files
        if [ "$(find "$selected_database" -maxdepth 1 -type f -print -quit)" ]; then
            echo -e "\x1b[1;31m WARNING: The directory contains files. \x1b[0m"
            
            # Prompt user to confirm deletion
            read -p "Do you want to continue deleting the database? (y/n): " answer
            case "$answer" in
                [yY])
                    rm -r "$selected_database"
                    echo -e "\x1b[32m The database : ${selected_database} is Dropped Successfully \x1b[0m"
                    break
                    ;;
                *)
                    echo "Deletion canceled."
                    break
                    ;;
            esac
        else
            # Directory is empty, proceed with deletion
            rm -r "$selected_database"
            echo -e "\x1b[32m The database : ${selected_database} is Dropped Successfully \x1b[0m"
            break
        fi
    fi
done

cd - &> /dev/null
