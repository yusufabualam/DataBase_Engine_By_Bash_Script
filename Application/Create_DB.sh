#!/usr/bin/bash

cd  ../Data


while true 
do
echo "Write The Name Of The Database" 
read db_Name

case $db_Name in
'')
echo "the name canot be empty"
continue;;
*[[:space:]]  | *[[:space:]]* | [[:space:]]*) 
echo  "the name can not have spaces"
continue 
    ;;

[0-9]*)
echo "the name can not contain integers"
continue
    ;;
*[a-zA-Z_]*[a-zA-Z_] | [a-zA-z_] )
    if (find $db_Name 'ls -F | grep /' &> /dev/null 2>&1)
    then
        echo "already existing database"
        continue
    else
        mkdir $db_Name
        break
    fi 
    ;;
*) 
echo "please ,write a valid name"  
continue;;

esac
done



cd - &> /dev/null 2>&1 
