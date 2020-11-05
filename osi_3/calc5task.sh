#!/bin/bash

res=1
op="+"
tail -f tmp.log |
while true
do
    read line
    case $line in
    '+')
        op='+'
        echo "Adding"
    ;;
    '*')
        op='*'
        echo "Multipling"
    ;;
    [0-9]*)
        buff=$(echo $line | grep -Ehs "[a-zA-Z\.,\ ]")
        if [[ -n $buff ]]
        then
            echo "error"
            continue
        fi
        if [[ "$op" == '+' ]]
        then
            res=$(($res+$line))
        else
            res=$(($res*$line))
        fi
        echo "$op $line = $res"
    ;;
    "QUIT")
        kill $(ps aux | grep "tail -f tmp.log" | tail -n 2 | head -n 1 | awk '{print $2}')
        exit 0
    ;;
    *)
        echo "error"
    ;;
    esac
done