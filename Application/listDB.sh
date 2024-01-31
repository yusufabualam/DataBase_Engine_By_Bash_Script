#!/usr/bin/bash

#!/bin/bash

echo -e "\n\x1b[1;33m --------  the Existing Database -------- \x1b[0m\n"

cd ../Data

counter=1
ls -F | grep / | tr -d '/' | while read -r directory; do
    echo "$counter. $directory"
    ((counter++))
done

cd - &> /dev/null
