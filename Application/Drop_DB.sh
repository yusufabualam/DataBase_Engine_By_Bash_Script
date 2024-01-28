#!/usr/bin/bash

cd ../Data

PS3=" Type The dataBase Number you want to drop ... "

echo " -------- Hello from Droping Database -------- "

array=(`ls -F | grep / | tr / " " `)

select choice in ${array[*]}
do 
    if [ $REPLY -gt ${#array[*]} ]  
    then
        echo " $REPLY not on the menu please select another number "
        continue
    else 
        rm -r ${array[${REPLY} -1]}
        echo " The dataBase >> ${array[${REPLY} -1]} is dropped Successfully "
        break
    fi
done

cd - &> /dev/null