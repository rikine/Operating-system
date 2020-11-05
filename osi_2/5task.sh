#!/bin/bash

ppid=0
count=0
art_time=0

cat file.log |
( while read line
do
    ppid_cur=$(echo "$line" | awk '{print $7}')
    avg_time=$(echo "$line" | awk '{print $11}')

    if [[ "$ppid" == "$ppid_cur"]]
    then
        art_time=$(echo "scale=6; $art_time + $avg_time" | bc -l)
        count=$(($count+1))
    else
        art_time=$(echo "scale=6; $art_time / $count" | bc -l)
        echo "Average_Sleeping_Children_of_ParentID = $ppid is $art_time"
        art_time=$avg_time
        count=1
        ppid=$ppid_cur
    fi
    echo "$line"
done > file.log

art_time=$(echo "scale=6; $art_time / $count" | bc -l)
echo "Average_Sleeping_Children_of_ParentID = $ppid is $art_time" >> file.log)