#!/bin/bash

if [ "$1" == "" ]
then
    echo "Sytax : ./ipcheck.sh [file name of list IP Address]"

else 
    count=$(wc -l $1  | cut -d " " -f 1)

    for (( i=1; i<=$count; i++))
    do
        a=$(head --lines=$i $1 | tail --lines=1)
        ping=$(ping -c4 $a | grep -i "received")
        if [[ $ping == *"100% packet loss"* ]]
        then
            echo $a " Not Reachable[-]"
        else
            echo $a " Reachable[+]"
        fi
    done
fi
