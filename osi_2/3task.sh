#!/bin/bash

ps -eo pid, stime | sort -r -k2 | head -n 9 | sort -k2 | head -n 1 | awk '{print $1}'