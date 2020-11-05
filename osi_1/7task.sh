#!/bin/bash

mail="[a-zA-Z0-9_.]+@[a-zA-Z0-9_]+(\.[a-zA-Z]+)+"
grep -E -h -s -o $mail /etc/* | awk '{printf("%s, ", $1)}' | sed 's/\(.*\), /\1\n/' > emails.lst