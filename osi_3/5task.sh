#!/bin/bash

echo "+" > tmp.log
./calc5task.sh&

while true
do
    read line
    if [[ "$line" == "QUIT" ]]
    then
        echo "QUIT" >>> tmp.log
        exit 0
    fi
    if [[ "$line" == "*" ]]
    then
        echo "*" >> tmp.log
    else
        echo $line >> tmp.log
    fi
done