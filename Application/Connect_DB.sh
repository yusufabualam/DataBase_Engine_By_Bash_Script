#!/usr/bin/bash

#!/usr/bin/bash


Ps3= "Type your Db to Connect With"

echo 
echo " ---------Select your DBnumber from the menu <----"
echo 
cd ../Data

# array=('ls -F | grep/ | tr / " "')
array=( $(ls -F ../Data | tr '/' ' ') )



select choice in ${array[*]}
do
  if [ $REPLY -gt ${#array[*]} ] 
  then 
  echo "
   $REPLY not on the menu "
   continue
else 
cd ../Data/${array[${REPLY}-1]}
echo " .... you are connected to  ${array[${REPLY}-1]} DB ..."
echo 
break
fi
done
echo

Ps3=" T"



