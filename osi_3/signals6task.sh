#!/bin/bash

echo $$ > pid
n=1
mode="+"

sigterm()
{
    mode="exit"
}

usr1()
{
    mode="+"
}

usr2()
{
    mode="*"
}

trap 'sigterm' SIGTERM
trap 'usr1' USR1
trap 'usr2' USR2

while true
do
    case $mode in
    "+")
        n=$(($n+2))
    ;;
    "*")
        n=$(($n*2))
    ;;
    "exit")
        exit 0
    ;;
    echo $n
    sleep 1
done