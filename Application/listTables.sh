echo "list table"

counter=1
find $PWD -maxdepth 1 -type f -printf "%f\n" | while read -r file; do
    echo "$counter. $file"
    ((counter++))
done

