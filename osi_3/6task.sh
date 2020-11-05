#!/bin/bash

./signals6task.sh&

while true
do
    read line
    case $line in
    "term")
        kill -SIGTERM $(cat pid)
        echo "EXITTED"
        exit 0
    ;;
    "+")
        kill -USR1 $(cat pid)
    ;;
    "*")
        kill -USR2 $(cat pid)
    ;;
    *)
        :
    ;;
    esac
done