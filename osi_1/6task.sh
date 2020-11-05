#!/bin/bash

grep -E -h -s "(WW)" /var/log/anaconda/X.log | sed -E "s/\(WW\)/Warnign: /" > full.log
grep -E -h -s "(II)" /var/log/anaconda/X.log | sed -E "s/\(II\)/Warnign: /" >> full.log

cat full.log