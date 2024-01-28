#!/usr/bin/bash

#!/usr/bin/bash


Ps3= "Type your Db to Connect With"

echo 
echo " ---------Select your DBnumber from the menu <----"
echo 
cd ../Data

# array=('ls -F | grep/ | tr / " "')
array=( $(ls -F ../Data | tr '/' ' ') )



select choice in ${array[*]}
do
  if [ $REPLY -gt ${#array[*]} ] 
  then 
  echo "
   $REPLY not on the menu "
   continue
else 
cd ../Data/${array[${REPLY}-1]}
echo " .... you are connected to  ${array[${REPLY}-1]} DB ..."
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
    esac
    done
    

    
    
    



cd - &> /dev/null 2>&1 



