echo -e "\n\e[1;34m ------ The Tables List in the Database -------\n\e[0m" 

counter=1
find $PWD -maxdepth 1 -type f -printf "%f\n" | while read -r file; do
    echo "$counter. $file"
    ((counter++))
done

