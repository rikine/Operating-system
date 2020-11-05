#!/bin/bash

time_now=$(date +%d.%m.%y_%H:%M:%S)

mkdir ~/test && echo "catalog test was created successfully" >> ~/report.txt && touch ~/test/$time_now.txt

ping -qc 1 net_nikogo.ru || echo "Site is not avaliable" >> ~/report.txt