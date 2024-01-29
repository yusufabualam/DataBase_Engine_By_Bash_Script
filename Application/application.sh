#!/usr/bin/bash
echo -e "\n\\e[31m<<<<<<<<<<<<<<< Welcome To Our Project >>>>>>>>>>>>>>>>>>\n\e[0m"

echo -e "\e[34m.............. What Do You Want TO Do .....................\n\n\e[0m"
select menu in Create_DB List_dataBase Connect_dataBase Drop_dataBase Exit_The_Menu
do
case $menu in 
Create_DB )
    Create_DB.sh
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
  echo -e "\n\e[34m--------Exiting ( I love Linux )-------\e[0m"
    break
    ;;
esac
done