#!/bin/bash

echo Enter 1 to open Nano
echo Enter 2 to open Vim
echo Enter 3 to open Browser Links
echo Enter 4 to close Menu

read a
if [[ "$a" -eq "1" ]]
then
    nano
fi
if [[ "$a" -eq "2" ]]
then
    vi
fi
if [[ "$a" -eq "3" ]]
then
    links
fi
if [[ "$a" -eq "4" ]]
then
    exit 0
fi