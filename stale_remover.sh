#!/bin/bash

# Author: Emmanuel Ramos
# Created Date: 08/04/2023
# Last Modified Date: 08/04/2023

# Description
# Asks the user which folder they want to remove stale from, and to define 
# how many days files should be unmodified for to be considered stale. 

# Usage:
# ./stale_remover.sh

read -r -p "Which folder do you want to remove stale files from? " folder 
read -r -p "How many days files should be unmodified for to be considered stale? " days 

readarray -t files < <(find "$folder" -maxdepth 1 -type f -mtime "+$days")

for file in "${files[@]}"; do
  rm -i "$file"
done