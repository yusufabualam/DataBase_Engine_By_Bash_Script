#!/usr/bin/bash

select menu in Create_dataBase List_dataBase Connect_dataBase Drop_dataBase Exit_The_Menu
do
case $menu in 
Create_DB )
    ./Create_DB.sh
    ;;
List_dataBase )
    ./List_DB.sh
    ;;
Connect_dataBase )
    ./Connect_DB.sh
    ;;
Drop_dataBase )
    ./Drop_DB.sh
    ;;
Exit_The_Menu )
    echo " -------- Exiting -------- "
    break
    ;;
esac
done