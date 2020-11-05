#!/bin/bash

>file.log
avg_time=0
for pid in $(ps -eo pid)
do
    ppid=$(grep -E -s -h "^PPid:" /proc/$pid/status | awk '{print $2}')
    ser=$(grep -E -s -h "^se.sum_exec_runtime:" /proc/$pid/sched | awk '{print $3}')
    ns=$(grep -E -s -h "^nr_switches:" /proc/$pid/sched | awk '{print $3}')

    if [[ -z "ppid" ]]
    then
        ppid=0
    fi
    
    if [[ -z "$ser" ]] || [[ -z "$nr_switches" ]]
    then
        avg_time=0
    else
        avg_time=$(echo "scale=6; $ser/$ns" | bc -l)
    fi

    echo "ProcessID = $pid : Parent_ProcessID = $ppid : Average_Running_Time = $avg_time" >> file.log
done
echo "$(cat file.log | sort -k4 file.log)" > file.log