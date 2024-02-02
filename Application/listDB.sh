#!/usr/bin/bash
cd ../Data
<<<<<<< HEAD


if [ -z "$(ls -F | grep /)" ]; then
    echo -e "\x1b[1;31m No databases found.\x1b[0m"
    
   
    read -p "Do you want to create a new database? (y/n): " answer
    case "$answer" in
        [yY])
            
            Create_DB.sh
          
            ;;
        *)
            echo "Exiting..."
            ;;
    esac
else

    ls -F  | grep / | tr / " " 
fi

=======
echo -e "\n\x1b[1;33m --------  the Existing Database -------- \x1b[0m\n"
counter=1
ls -F | grep / | tr -d '/' | while read -r directory; do
    echo "$counter. $directory"
    ((counter++))
done
>>>>>>> 54e37ad0ceb0526bcc42d659394b9d5f063d8ff4
cd - &> /dev/null
