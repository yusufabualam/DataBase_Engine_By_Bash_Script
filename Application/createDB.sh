#!/usr/bin/bash

cd  ../Data

while true;
 do
    echo -e "\n\e[1;34m ------ Write A Valid  Name of The Data Base or Zero (0) to Exit -------\n\e[0m" 
    read -r db_Name
if [ "$db_Name" = "0" ] ||  [ "$db_Name" = "zero" ]; then
    echo -e "\n\e[1;34m You are Exiting without creating a Database \e[0m"
    exit 0
fi
    valid_regex="^[a-zA-Z][a-zA-Z0-9_]*[a-zA-Z0-9]$"

    case $db_Name in
        '')
            echo -e "\n\e[1;31m  The Name Cannot Be Empty \n \e[0m"
            continue;;
         *[[:space:]] | *[[:space:]]* | [[:space:]]*) 
            echo -e "\n\e[1;31m The Name Can't Contain Any Space \n \e[0m"
            continue ;;
     
        *[[:space:]]*)
            echo -e "\n\e[31m ------The Name Can't Start with Any Space -------\n \e[0m"
            ;;

        [!a-zA-Z]*)
            echo -e "\n\e[1;31m The Name Can't Start with a Special Character or Numbers \n \e[0m"
            continue
            ;;
    
        *)
            if [ ${#db_Name} -lt 3 ]; then
            echo -e "\n\e[1;31mThe Name Must Be At Least 3 Characters \n \e[0m"
            elif [[ ! $db_Name =~ $valid_regex ]]; then
                echo -e "\n\e[1;31m Invalid Database Name \n \e[0m"
                echo -e "\n\e[1;31m *** Name must start with a letter, followed by letters, numbers, underscores, And Not Have Special Characters ***\n \e[0m"
            elif [ -d "$db_Name" ]; then
                echo -e "\n\e[1;31m Database Already Exists \n \e[0m"
            else
                # Ask for confirmation
                echo -e "\n\e[1;34m Are you sure you want to create a database with the name: \e[93m$db_Name\e[0m? [Y/N]"
                read -r confirmation
                case $confirmation in
                    [Yy])
                        mkdir "$db_Name"
                        echo -e "\n\e[1;32m The Database Created Successfully\n \e[0m"
                        break
                        ;;
                    [Nn])
                        echo -e "\n\e[1;31m Database creation canceled \e[0m"
                        break
                        ;;
                    *)
                        echo -e "\n\e[1;31m Invalid choice. Database creation canceled \e[0m"
                        break
                        ;;
                esac
            fi
            ;;
esac
done




cd - &> /dev/null 2>&1

