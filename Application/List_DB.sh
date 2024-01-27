#!/usr/bin/bash

echo " -------- Hello This is the Existing Database -------- "

cd ../Data
ls -F | grep / | tr / " " 

cd - &> /dev/null