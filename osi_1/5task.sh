#!/bin/bash

grep -E -h -s "^[0-9][0-9]:[0-9][0-9]:[0-9][0-9],[0-9][0-9][0-9] INFO" /var/log/anaconda/syslog > info.log