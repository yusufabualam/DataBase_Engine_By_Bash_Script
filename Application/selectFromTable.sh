#!/usr/bin/bash
echo "
-----> Select your Table number from the menu <--------
"
array=(`ls `)

select choice in ${array[*]}
do
    if [ $REPLY -gt ${#array[*]} ]
    then
        echo "
        $REPLY is not on the menu
        "
        continue
    else
        echo "
        ... You selected ${array[${REPLY}-1]} Table...
        "
        table_name=${array[${REPLY}-1]}
        break
    fi
done

#validate table name
columns=`head -1 "$table_name" | awk 'BEGIN{ RS = ":";} {print $1}'`

select choice in Select_all Select_column Select_row
do
    case $choice in
    Select_all )
        echo "selecting all fields "
        cat $table_name
        ;;
    Select_column )
        echo "Choose the column you want to select: "
        select ch in $columns
        do
            case $ch in
            name | address)
                awk -F':' -v col="$ch" '{ if ($1 == col) print $2 }' $table_name
                break
                ;;
            esac
        done
        ;;
    Select_row )
        read -p "Input your id (PK) row: " pk
        row=`awk -F':' ' {  if($1=='$pk')  print $0}' $table_name  `
        # check if the PK exists
        if grep -Fxq "$row" "$table_name" > /dev/null;
        then
            echo "------------------------"
            echo `head -1 "$table_name"`
            echo "------------------------"
            echo `grep ^$pk $table_name `
        else
            echo "id (PK) '$pk' doesn't exist. Please press 'enter' and write a valid id."
        fi
        ;;
    esac
done