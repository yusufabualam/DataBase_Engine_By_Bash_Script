#!/usr/bin/bash

# get table name
echo  -e "\n\e[1;34m 
-----> Select your Table number That You Want to Delete From  the Menu or Zero To Exit  <--------
\e[0m"
array=(`ls`)

select choice in  ${array[*]}
do
if [ "$REPLY" = "0" ]; then
 echo -e "\n\e[1;34m You are Exiting without Deleting Anything \e[0m"
exit 0
 elif [ -z "$REPLY" ]; then
 echo -e "\n\e[1;31m Enter Your Table Name !! \n \e[0m"
continue
 elif ! [[ "$REPLY" =~ ^[0-9]+$ ]]; then
echo -e "\n\e[1;31m Enter  numeric option from the menu \n \e[0m"
continue
elif [ "$REPLY" -gt "${#array[@]}" ]; then
  echo -e "\n\e[1;31m $REPLY is not on the menu \n \e[0m"
 continue
 else
 echo -e "\n\e[1;36m... You selected ${array[${REPLY}-1]} Table...\n\e[0m"
 table_name=${array[${REPLY}-1]}

# Display table content
echo -e "\n\e[1;34m --- Content of The  $table_name  Table  --\n\e[0m"
tput bold
tput setaf 4 # Set text color to blue
cat "$table_name"
tput sgr0   # Reset text attributes

break
    fi
done






echo -e "\n\e[1;34m --- What Do You Want To DO \n\e[0m" 
if [[ -f "$table_name" ]]; then
select choice in Delete_All Delete_Row
do
case $choice in
         
Delete_All )
echo -e "\n\e[1;34m --- Content of The  $table_name  Table  --\n\e[0m"
tput bold
tput setaf 4 # Set text color to blue
cat "$table_name"
tput sgr0   # Reset text attributes
sed -i '/^[[:digit:]]/d' "$table_name"
echo -e "\n\e[1;32m------all Row deleted successfully --\n\e[0m"
echo -e "\n\e[1;34m --- Content of The  $table_name  Table  Become --\n\e[0m"
tput bold
 tput setaf 4 # Set text color to blue
cat "$table_name"
tput sgr0   # Reset text attributes
;;

 Delete_Row )

tput bold
tput setaf 4 # Set text color to blue
cat "$table_name"
tput sgr0   # Reset text attributes

read -p "input your id(PK) row: " pk
row=$(awk -F':' -v var="$pk" '$1==var { print $0 }' "$table_name")
# check if the PK exists
if grep -Fxq "$row" "$table_name" > /dev/null; then
sed -i "/$row/d" "$table_name"
 echo -e "\n\e[1;32m------Row deleted successfully --\n\e[0m"
 echo -e "\n\e[1;34m --- Content of The  $table_name  Table  Become  --\n\e[0m"
 tput bold
tput setaf 4 # Set text color to blue
cat "$table_name"
tput sgr0   # Reset text attributes
 else
 echo "id(PK) '$pk' doesn't exist. Please enter a valid id."
fi
;;
0)

echo -e "\n\e[1;34m You are Exiting without Deleting Anything \e[0m"
exit 0
;;
 * )
   echo -e "\n\e[1;34m Choose A Valid Option !! \e[0m"
 exit 0
   ;;
esac
done
else
echo "$table_name doesn't exist. Press enter to try again!!"
fi
