#!/bin/bash

s=""
result=""
while [[ "$s" != 'q' ]]
do
    result+="$s"
    read s
done
echo "$result"