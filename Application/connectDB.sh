#!/usr/bin/bash

PS3=$'\n\e[1;33m Select A Datbase you Want to Connect >> \n \e[0m'

echo -e "\n\x1b[1;34m ------------------ Select DataBase To Connect With or (0) to Exit ------------------  \n\x1b[0m"

cd ../Data

# array=('ls -F | grep/ | tr / " "')

array=( $(ls -F ../Data | tr '/' ' ') )

select choice in ${array[*]}
do
    if [ "$REPLY" = "0" ]; then
       echo -e "\n\e[1;34m You are Now Exiting without connecting with Database \n\e[0m"
        exit 0

  elif ! [[ "$REPLY" =~ ^[0-9]+$ ]]; then
        echo -e " \n\x1b[1;31m Please enter a valid numeric choice.\n\x1b[0m"
        continue
    elif [ "$REPLY" -gt "${#array[@]}" ]; then
        echo -e " \n\x1b[1;31m $REPLY Your Input Is Not Included In The  DataBase \n\x1b[0m"
        continue
    else
      cd ../Data/${array[${REPLY}-1]}
      echo -e "\n\x1b[1;32m.... You Are connected Successfully with \e[93m$choice\e[0m \x1b[1;32mDatabase ...\x1b[0m" 
      break
   fi
done


PS3=$'\n\e[1;33m What do you want to do with Selected Database >> \n \e[0m'
select choice in Create_Table  List_Table Drop_table Insert_IN_Table Select_from_Table Delete_From_Table UpDate_From_Table Exit_From_Menu
do
case $choice in 
     Create_Table )
     echo "
    creating table .."
    createTable.sh
    ;;
    List_Table )
     echo "
    listing table .."
      listTables.sh
    ;;
    Drop_table)
     echo "
    Droping table .."
       dropTable.sh
    ;;
    Insert_IN_Table)
     echo "
    insert into table .."
       insertIntoTable.sh
    ;;
    Select_from_Table)
     echo "
     select from table .."
       selectFromTable.sh
    ;;
    Delete_From_Table)
     echo "
     delete from table .."
       deleteFromTable.sh
    ;;
    UpDate_From_Table)
     echo "
     update in table .."
       updateTable.sh
    ;;
    Exit_From_Menu )
      echo -e "\n\e[1;34m You are Now Exiting without choosing any options \n\e[0m"
      break
    ;;
   
       *)
     echo -e "\n\e[1;31m Invalid Choice \e[0m\n"
    ;;
    esac
    done
    
cd - &> /dev/null 2>&1 



