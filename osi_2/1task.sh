#!/bin/bash

ps aux | grep -E "^user" | wc -l > psUser.log
ps aux | grep -E "^user" | awk 'BEGIN{OFS=":"} {print $2, $11}' >> psUser.log