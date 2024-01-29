#!/usr/bin/bash

# Listing the Tables in the database connected
 echo " ---------- Already Existing Tables ---------- "
 ls -s 

 # ---- Create Table Name ----
 while true 
 do 
 read -p " Insert the Table you want to create .... "
 
 table_name=$REPLY

 case $table_name in 
 # Check an empty input 
 '' )
 echo " The Table Name Cannot be Empty "
 continue
    ;;
# Check the spaces 
*[[:space:]] | *[[:space:]]* | [[:space:]]* )
 echo " The Table Name Cannot have spaces "
 continue
    ;;
# Checking as it not begins with numbers
[0-9]* )
 echo " The Table Name Cannot starts with numbers "
 continue
    ;;
# Check the special character
*[[:punct:]] | *[[:punct:]]* | [[:punct:]]* )
 echo " The Table Name Cannot have special character "
 continue
    ;;
*[a-zA-Z_]*[a-zA-Z_] | [a-zA-Z] )
    if (find $table_name `ls -F` &> /dev/null 2>&1) 
    then
        echo "The Table is already exists"
        continue
    else
        touch $table_name
    fi 
echo "The Table is created Successfully"
break
    ;;
esac
done

# ---- Insert columns to Table ----

# Insert number of columns 
while true 
do 
read -p "Insert Number of Columns You Want for $table_name table: ... "
col_num=$REPLY

case $col_num in 
*[0] )
    echo "The field number cannot be equal to $col_num "
    continue 
    ;;
*[1-9] | *[1-9]*[0-9] )
    echo "The Table column number is equal to $col_num "
    break
    ;;
* )
    echo "Please Write a Valid Number ..."
    continue
    ;;
esac
done

# Insert the columns name (meta data)
let col_num=col_num
echo "Insert Your Meta-Data for the $table_name table"
echo "Insert Your Column Names"
for ((i=2;i<=$col_num;i++))
do 
    while true 
    do
        read -p "Column Number $i Name is: "
        col_name=$REPLY
        case $col_name in
        # Check an empty input 
        '' )
        echo " The Table Name Cannot be Empty "
        echo " Please Insert another name .... "
        continue
            ;;
        # Check the spaces 
        *[[:space:]] | *[[:space:]]* | [[:space:]]* )
        echo " The Table Name Cannot have spaces "
        echo " Please Insert another name .... "
        continue
            ;;
        # Checking as it not begins with numbers
        [0-9]* )
        echo " The Table Name Cannot starts with numbers "
        echo " Please Insert another name .... "
        continue
            ;;
        # Check the special character
        *[[:punct:]] | *[[:punct:]]* | [[:punct:]]* )
        echo " The Table Name Cannot have special character "
        echo " Please Insert another name .... "
        continue
            ;;
        *[a-zA-Z_]*[a-zA-Z_] | [a-zA-Z] )
            if (find $col_name `head -1 $table_name` &> /dev/null 2>&1) 
            then
                echo "The column name $col_name is already exists"
                continue
            else
                if [ $i -eq 2 ] 
                then 
                    row_name+="id(pK):"$col_name:
                else 
                    row_name+=$col_name:
                fi
            break
            fi
            ;; 
        * )
        echo "The name Cannot have Special Character" 
        continue
            ;;
        esac
    done
done

# Insert data type
echo $row_name >> $table_name
echo " Insert the Data Type of Columns Between String or Integer"
echo "Note The First Column will be id(pK) choose integer as type data"
PS3=" Type your choice for the Type of Data: "

for ((i=1;i<=$col_num;i++))
do
if [ $i -eq 1 ] 
then 
    row_type+="integer:"$row_type:
else 
select choice in String Integer
do 
case $choice in
String )
echo String 
     row_type+=String:
     break
     ;;
Integer )
echo Integer 
    row_type+=Integer:
    break
    ;;
* )
echo " Only String or Integer are Available "
continue 
;;
esac
done
fi
done
    echo $row_type >> $table_name
    echo "
    Your Table Met-Data is 
    $row_name
    $row_type
    "