#!/bin/bash

# Author: Emmanuel Ramos
# Date Created: 08/03/2023
# Last Modified: 08/03/2023

# Description
# Counts down and prints the remaining seconds.

# Usage:
# Using minutes = ./timer -m <number of minutes>
# Using seconds = ./timer -s <number of seconds>

total_seconds=0

while getopts "m:s:" opt; do
    case "$opt" in 
        m) total_seconds=$(( total_seconds + $OPTARG * 60 ));;
        s) total_seconds=$(( total_seconds + $OPTARG ));;
        \?) exit 1
    esac    
done 

if [[ $total_seconds -gt 0 ]]; then
    while [[ $total_seconds -gt 0  ]]; do 
        echo "${total_seconds}s"
        total_seconds=$(( --total_seconds ))
        sleep 1s
    done
fi 

echo "Time's up!"