#!/usr/bin/bash

select menu in Create_DB List_DB Connect_DB Drop_DB Exit
do
case $menu in 
Create_DB )
    ./Create_DB.sh
    ;;
List_DB )
    ./List_DB.sh
    ;;
Connect_DB )
    ./Connect_DB.sh
    ;;
Drop_DB )
    ./Drop_DB.sh
    ;;
Exit )
    echo " -------- Exiting -------- "
    break
    ;;
esac
done