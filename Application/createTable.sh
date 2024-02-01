#!/usr/bin/bash

# Listing the Tables in the database connected
 echo " ---------- Already Existing Tables ---------- "
 ls -s 

 # ---- Create Table Name ----
<<<<<<< HEAD
 while true 
 do 
 read -p " Insert the Table you want to create .... "
 

=======
while true 
do 
    echo -e "\n\e[1;34m ------ Write A Valid  Name of The Table or Zero (0) to Exit -------\n\e[0m" 
    read -r table_name
if [ "$table_name" = "0" ] ||  [ "$table_name" = "zero" ]; then
    echo -e "\n\e[1;34m You are Exiting without creating a Table \e[0m"
    exit 0
fi
>>>>>>> f0fdc38f496bc1791e804aa3be59fded21876993

valid_regex="^[a-zA-Z][a-zA-Z0-9_]*[a-zA-Z0-9]$"
 
# table_name=$REPLY
case $table_name in 
'' )
    echo -e "\n\e[1;31m The Name Cannot Be Empty \n \e[0m"
    continue ;;
*[[:space:]] | *[[:space:]]* | [[:space:]]*) 
    echo -e "\n\e[1;31m The Name Can't Contain Any Space \n \e[0m"
    continue ;;
[!a-zA-Z]*)
    echo -e "\n\e[1;31m The Name Can't Start with a Special Character or Numbers \n \e[0m"
    continue ;;   
*)
    if [ ${#table_name} -lt 3 ]; then
        echo -e "\n\e[1;31mThe Name Must Be At Least 3 Characters \n \e[0m"
    elif [[ ! $table_name =~ $valid_regex ]]; then
        echo -e "\n\e[1;31m Invalid Table Name \n \e[0m"
        echo -e "\n\e[1;31m *** Name must start with a letter, followed by letters, numbers, underscores, And Not Have Special Characters ***\n \e[0m"
    elif [ -f "$table_name" ]; then
        echo -e "\n\e[1;31m Table Already Exists \n \e[0m"
    else
        echo -e "\n\e[1;34m Are you sure you want to create a table name with the name: \e[93m$table_name\e[0m? [Y/N]"
        read -r confirmation
        case $confirmation in
        [Yy] )
            touch "$table_name"
            echo -e "\n\e[1;32m The Table Created Successfully\n \e[0m"
            # ---- Insert columns to Table ----

            # Insert number of columns 
            while true 
            do 
            read -p "Insert Number of Columns You Want for $table_name table: ... "
            col_num=$REPLY

            case $col_num in 
            *[0] )
                echo -e "\n\e[1;31m The field number cannot be equal to $col_num \e[0m"
                continue 
                ;;
            *[1-9] | *[1-9]*[0-9] )
                echo -e "\n\e[1;32m The Table column number is equal to $col_num \n \e[0m"
                break
                ;;
            * )
                echo -e "\n\e[1;31m Please Write a Valid Number no letters or special character is allowed ... \e[0m"
                continue
                ;;
            esac
            done

            # Insert the columns name (meta data)
            let col_num=col_num
            echo -e "\n\e[1;34mInsert Your Meta-Data for the \e[93m$table_name\e[0m table \e[0m"
            echo -e "\n\e[1;34mFirst >> Insert Your Column Names\n \e[0m"
            for ((i=2;i<=$col_num;i++))
            do 
                while true 
                do
                    read -p "Column Number $i Name is: "
                    col_name=$REPLY
                    case $col_name in
                    '' )
                        echo -e "\n\e[1;31m The Name Cannot Be Empty \n \e[0m"
                        continue ;;
                    *[[:space:]] | *[[:space:]]* | [[:space:]]*) 
                        echo -e "\n\e[1;31m The Name Can't Contain Any Space \n \e[0m"
                        continue ;;
                    [!a-zA-Z]*)
                        echo -e "\n\e[1;31m The Name Can't Start with a Special Character or Numbers \n \e[0m"
                        continue ;;
                    *)   
                        if [ ${#col_name} -lt 2 ]; then
                            echo -e "\n\e[1;31mThe Name Must Be At Least 2 Characters \n \e[0m"
                        elif [[ ! $col_name =~ $valid_regex ]]; then
                            echo -e "\n\e[1;31m Invalid Column Name \n \e[0m"
                            echo -e "\n\e[1;31m *** Name must start with a letter, followed by letters, numbers, underscores, And Not Have Special Characters ***\n \e[0m"
                        elif (find $col_name `head -1 $table_name` &> /dev/null 2>&1) ; then
                            echo -e "\n\e[1;31m The column name $col_name is already exists \n \e[0m"
                            continue
                        else
                            if [ $i -eq 2 ] 
                            then 
                                row_name+="id(pK):"$col_name:
                            else 
                                row_name+=$col_name:
                            fi
                        break
                        fi
                        ;; 
                    esac
                done
            done

            # Insert data type
            echo $row_name >> $table_name
            echo -e "\n\e[1;34mSecond >> Insert the Data Type of Columns Between \e[93mstring\e[1m \e[1;34mand\e[0m \e[93minteger\n\e[0m"
            echo -e "\e[1;33mImportant Remark:\e[0m  \e[1;31mNote The First Column will be id(pK) and its meta-data is integer as type data\n\e[0m"
            PS3=$'\n\e[1;33m Type your choice for the Type of Data from Second Column >> \e[0m'

            for ((i=1;i<=$col_num;i++))
            do
            if [ $i -eq 1 ] 
            then 
                row_type+="integer:"$row_type:
            else 
            select choice in String Integer
            do 
            case $choice in
            String )
            echo String 
                row_type+=String:
                break
                ;;
            Integer )
            echo Integer 
                row_type+=Integer:
                break
                ;;
            * )
            echo -e "\e[1;31mOnly String or Integer are Available\e[0m"
            continue 
            ;;
            esac
            done
            fi
            done
                echo $row_type >> $table_name
                echo -e "
                \e[1;32mYour Table Met-Data is : \e[0m
                $row_name
                $row_type
                "
        break ;;
        [Nn])
            echo -e "\n\e[1;31m Database creation canceled \e[0m"
            break ;;
        *)
            echo -e "\n\e[1;31m Invalid choice. Database creation canceled \e[0m"
            break ;;
        esac
    fi
esac
done
