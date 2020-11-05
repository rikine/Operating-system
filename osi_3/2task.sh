#!/bin/bash

at now+2minutes -f ./1task
tail -n 0 -f ~/report.txt