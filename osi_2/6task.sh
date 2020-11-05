#!/bin/bash

saved_pid=0
saved_mem=0

for pid in $(ps -Ao pid)
do
    mem=$(grep -E -h -s "^RssAnon:" /proc/$pid/status | awk '{print $2}')
    if [[ "$mem" -ge "$saved_mem" ]]
    then
        saved_mem = $mem
        saved_pid = $pid
    fi
done
echo "PID = $saved_pid : Memory_Usage = $saved_mem KB"

echo "$(top -b -o +%MEM | head -n 8 | tail -n 1 | awk '{printf "PID = %s : Memory_Usage = %s MB", $1, $10}')"