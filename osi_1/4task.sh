#!/bin/bash

if [[ "$PWD" == "$HOME" ]]
then
    echo "$HOME"
else
    echo "File is running not in home folder"
    exit 1
fi