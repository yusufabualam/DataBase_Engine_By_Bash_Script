#!/usr/bin/bash
PS3=$'\n\e[1;33m Welcome to the dataBase Menu, Please Enter your Choice >> \e[0m'
echo -e "\n\\e[1;43m<<<<<<<<<<<<<<< We Love Linux And Hate Windows >>>>>>>>>>>>>>>\n\e[0m"
echo -e "\n\\e[1;35m<<<<<<<<<<<<<<<     Welcome To Our Project     >>>>>>>>>>>>>>>\n\e[0m"

echo -e "\e[1;34m------------------  What Do You Want TO Do   ------------------\n\n\e[0m"
select menu in Create_dataBase List_dataBase Connect_dataBase Drop_dataBase Exit_The_Menu
do
case $menu in 
Create_dataBase )
    createDB.sh
    ;;
List_dataBase )
    ./listDB.sh
    ;;
Connect_dataBase )
    ./connectDB.sh
    ;;
Drop_dataBase )
    ./dropDB.sh
    ;;
Exit_The_Menu )
  echo -e "\n\e[1;34m--------  Exiting ( I love Linux )-------\n\e[0m"
    break
    ;;
*)
     echo -e "\n\e[1;31m Invalid Choice \e[0m\n"
    ;;
esac
done