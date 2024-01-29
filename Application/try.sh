#!/usr/bin/bash

cd  ../Data

while true; do
    echo -e "\n\e[34m ------Write The Name of the Database (At least 3 characters)-------\n\e[0m" 
    read -r db_Name

    valid_regex="^[a-zA-Z][a-zA-Z0-9_ ]*[a-zA-Z0-9]$"

    case $db_Name in
        '')
            echo -e "\n\e[31m ------The Name Cannot Be Empty -------\n \e[0m"
            ;;
        *[[:space:]]*)
            echo -e "\n\e[31m ------The Name Can't Contain Any Space -------\n \e[0m"
            ;;
        *)
            if [ ${#db_Name} -lt 3 ]; then
                echo -e "\n\e[31m ------The Name Must Be At Least 3 Characters -------\n \e[0m"
            elif [[ ! $db_Name =~ $valid_regex ]]; then
                echo -e "\n\e[31m ------Invalid Database Name -------\n \e[0m"
                echo -e "\n\e[31m ------Name must start with a letter, followed by letters, numbers, underscores, or spaces -------\n \e[0m"
            elif [ -d "$db_Name" ]; then
                echo -e "\n\e[31m ------Database Already Exists -------\n \e[0m"
            else
                mkdir "$db_Name"
                echo -e "\n\e[32mThe Database Created Successfully\n \e[0m"
                break
            fi
            ;;
    esac
done
