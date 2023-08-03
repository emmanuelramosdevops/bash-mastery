#!/bin/bash

# Author: Emmanuel Ramos
# Date Created: 07/15/2023
# Last Modified: 07/17/2023

# Description
# Creates a backup in $currentdir folder of all files in the $HOME directory. 

# Usage:
# ./backup_script.sh

echo "Hello, ${USER^}"
echo "Will now backup your home directory, $HOME"
currentdir=$(pwd)
echo "Running this script from $currentdir"
echo "Therefore, I will save the backup in $currentdir"
tar -cf $currentdir/my_backup_"$(date +%d-%m-%Y_%H-%M-%S)".tar $HOME/* 2>/dev/null
echo "Backup completed successfully"
exit 0