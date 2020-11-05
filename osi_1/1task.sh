#!/bin/bash

if [ "$#" -ne "3" ]
then
    echo "There must be 3 arguments"
    exit 1
fi

max="$1"
if [ "$2" -gt "$max" ]
then
    max="$2"
fi
if [ "$3" -gt "$max" ]
then
    max="$3"
fi
echo "max number = $max"