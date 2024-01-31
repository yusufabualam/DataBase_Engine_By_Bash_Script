#!/bin/bash

echo -e "\n\x1b[1;33m --------  the Existing Database -------- \x1b[0m\n"

cd ../Data


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

    ls -F --color=auto --classify | grep / | sed 's/\//\x1b[1;32m\/\x1b[0m/'
fi

cd - &> /dev/null
