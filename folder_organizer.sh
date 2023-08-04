#!/bin/bash

# Author: Emmanuel Ramos
# Created Date: 08/04/2023
# Last Modified Date: 08/04/2023

# Description
# Uses the output of an ls command to generate the list of files in a folder.

# Usage 
# ./ folder_organizer

# Creating files (idempotent)
dir="$HOME/files-$(date +%d-%m-%y-%H-%M-%S)"
mkdir "$dir"

# All extensions
touch "$dir/jpg.jpg"
touch "$dir/jpg1.jpg"
touch "$dir/doc.doc"
touch "$dir/xls.xls"
touch "$dir/sh.sh"
touch "$dir/zip.zip"
touch "$dir/ppt.ppt"
touch "$dir/mp3.mp3"
touch "$dir/mp4.mp4"
touch "$dir/txt"

# Organizing
while read -r file; do
    case "$file" in 
        *.jpg | *.jpeg | *.png) 
            subfolder="images"
            ;;
        *.doc | *.docx | *.txt | *.pdf) 
            subfolder="documents" 
            ;;
        *.xls | *.xlsx | *.csv) 
            subfolder="spreadsheets"
            ;;
        *.sh) 
            subfolder="scripts"
            ;;
        *.zip | *.tar | *.tar.gz | *.tar.bz2) 
            subfolder="archives"
            ;;
        *.ppt | *.pptx) 
            subfolder="presentations"
            ;;
        *.mp3) 
            subfolder="audio"
            ;;
        *.mp4) 
            subfolder="video"
            ;; 
        *) 
            subfolder=""
            ;;
        ?)  
            ;;       
    esac

    if [[ "$subfolder" != "" ]]; then
        if [[ ! -d "$dir/$subfolder" ]]; then
            mkdir "$dir/$subfolder"
        fi

        mv "$dir/$file" "$dir/$subfolder/$file"
    fi

done < <(ls "$dir")