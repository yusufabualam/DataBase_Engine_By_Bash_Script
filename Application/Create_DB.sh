#!/usr/bin/bash

cd  ../Data

while true; do
    echo -e "\n\e[34m ------Write The Name of the Database-------\n\e[0m" 
    read -r db_Name

    case $db_Name in
        '')
            echo -e "\n\e[31m ------The Name Cannot Be Empty -------\n \e[0m"
            continue;;
        *[[:space:]] | *[[:space:]]* | [[:space:]]*) 
            echo -e "\n\e[31m ------The Name Can't Contain Any Space -------\n \e[0m"
            continue ;;
        *[!a-zA-Z_]*) 
            echo -e "\n\e[31m ------The Name Can Only Contain Letters and Underscore -------\n \e[0m"
            continue ;;
        *[0-9]*)
            echo -e "\n\e[31m ------The Name Can't Contain Integers -------\n \e[0m"
            continue ;;
        *)
            if [ -d "$db_Name" ]; then
                echo -e "\n\e[31m ------Database Already Exists -------\n \e[0m"
                continue
            else
                mkdir "$db_Name"
              echo -e "\n\e[32mThe Database Created Successfully\n \e[0m"
                break
                
            fi ;;
    esac
done

echo -e "\n\e[34mThe  Do  you Want to\n \e[0m"
PS3="What Do You Want To Do Again? "
options=("Create Another Database" "Exit")
select choice in "${options[@]}";
 do
    echo -e "\n\e[34m ------Write The Name of the Database-------\n\e[0m" 
    read -r db_Name

    case $db_Name in
        '')
            echo -e "\n\e[31m ------The Name Cannot Be Empty -------\n \e[0m"
            continue;;
        *[[:space:]] | *[[:space:]]* | [[:space:]]*) 
            echo -e "\n\e[31m ------The Name Can't Contain Any Space -------\n \e[0m"
            continue ;;
        *[!a-zA-Z_]*) 
            echo -e "\n\e[31m ------The Name Can Only Contain Letters and Underscore -------\n \e[0m"
            continue ;;
        *[0-9]*)
            echo -e "\n\e[31m ------The Name Can't Contain Integers -------\n \e[0m"
            continue ;;
        *)
            if [ -d "$db_Name" ]; then
                echo -e "\n\e[31m ------Database Already Exists -------\n \e[0m"
                continue
            else
                mkdir "$db_Name"
              echo -e "\n\e[32mThe Database Created Successfully\n \e[0m"
                break
                
            fi ;;
    esac
    
done

cd - &> /dev/null 2>&1

