#!/usr/bin/bash

#!/bin/bash

echo -e "\n\x1b[1;33m --------  the Existing Database -------- \x1b[0m\n"

cd ../Data

ls -F --color=auto --classify | grep / | sed 's/\//\x1b[1;32m\/\x1b[0m/' 

cd - &> /dev/null
