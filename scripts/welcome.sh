#!/usr/bin/env bash 

greeting="Welcome" 
user=$(whoami)
day=$(date +%A)

echo $greeting back $user! Today is $day. Time to get going!
echo "Your bash version is $BASH_VERSION, Enjoy!"
