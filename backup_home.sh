#!/bin/bash

# Description
# Creates a backup in $currentdir folder of all files in the $HOME directory. 

# Usage:
# ./backup_home.sh

echo "Hello, ${USER^}"
echo "Will now backup your home directory, $HOME"

currentdir=$(pwd)
echo "Running this script from $currentdir"
echo "Therefore, I will save the backup in $currentdir"

tar -cf $currentdir/my_backup_"$(date +%d-%m-%Y_%H-%M-%S)".tar $HOME/* 2>/dev/null

echo "Backup completed successfully"
exit 0