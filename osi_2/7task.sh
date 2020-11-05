#!/bin/bash

>apid.log
>bpid.log

write()
{
    for pid in $(ps -Ao "%p" | tail -n +2)
    do
        echo $pid" "$(cat /proc/$pid/io 2>/dev/null | grep "read_bytes" | awk '{print $2}') >> $1.log
    done
}

write bpid
sleep 5s
write apid

> temp.log

while read line
do
    pid=$(echo $line | awk '{print $1}')
    adata=$(echo $line | awk '{print $2}')
    bdata=$(cat bpid.log | grep -E "$pid" | awk '{print $2}')
    [[ -z $bdata ]] && continue
    dif=$(echo "$adata-$bdata" | bc -l)
    diff=$(echo $dif | awk '{if ($1 < 0) print -$1}')
    com=$(ps -q $pid -o comm=)
    if [[ -z $diff ]]
    then
        echo "$pid:$com:$dif" >> temp.log
    else
        echo "$pid:$com:$diff" >> temp.log
    fi
done < apid.log

cat temp.log | sort -t ":" -nrk3 | head -3
rm apid.log bpid.log temp.log