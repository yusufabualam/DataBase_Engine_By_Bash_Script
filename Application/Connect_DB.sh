#!/usr/bin/bash

PS3=$'\n\e[33m    select valid choice to connect to database >> \n \e[0m'

echo -e "\n\x1b[1;32m ---------Select DataBase To Connect With------------ \n\x1b[0m"

cd ../Data

# array=('ls -F | grep/ | tr / " "')

array=( $(ls -F ../Data | tr '/' ' ') )



select choice in ${array[*]}
do
  if ! [[ "$REPLY" =~ ^[0-9]+$ ]]; then
        echo -e " \n\x1b[1;36m Please enter a valid numeric choice.\n\x1b[0m"
        continue
    elif [ "$REPLY" -gt "${#array[@]}" ]; then
        echo -e " \n\x1b[1;36m $REPLY Your Input Is Not Included In The  DataBase \n\x1b[0m"
        continue
    else
cd ../Data/${array[${REPLY}-1]}
echo -e "\n\x1b[1;34m.... You Are In ${choice} Database...\x1b[0m"

echo 
break
fi
done
echo

Ps3="Type your choice number "
select choice in Create_Table  List_Table Drop_table Insert_IN_Table Select_from_Table Delete_From_Table UpDate_From_Table 
do
case $choice in 
     Create_Table )
     echo "
    creating table .."
    create_Table.sh
    ;;
    List_Table )
     echo "
    listing table .."
      list_Tables.sh
    ;;
    Drop_table)
     echo "
    Droping table .."
       drop_Table.sh
    ;;
    Insert_IN_Table)
     echo "
    insert into table .."
       insert_Into_Table.sh
    ;;
    Select_from_Table)
     echo "
     select from table .."
       select_From_Table.sh
    ;;
    Delete_From_Table)
     echo "
     delete from table .."
       delete_From_Table.sh
    ;;
    UpDate_From_Table)
     echo "
     update in table .."
       upDate_Table.sh
    ;;
   
       *)
     echo -e "\n\e[31m Invalid Choice \e[0m\n"
    ;;
    esac
    done
    

    
    
    



cd - &> /dev/null 2>&1 



