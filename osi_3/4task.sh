#!/bin/bash

nice -n 8 ./cycle.sh&
nice -n 0 ./cycle.sh&
nice -n 0 ./cycle.sh&