#!/bin/bash

# Author: Emmanuel Ramos
# Created Date: 08/04/2023
# Last Modified Date: 08/04/2023

# Description
# Presents the user with a menu where they can choose which of the two scripts 
# they want to run and then have this script run the relevant script based on 
# the user’s selection.

# Usage 
# ./toolkit.sh

stale_script_txt="Stale Remover"
stale_script_name="stale_remover.sh"

folder_script_txt="Folder Organizer"
folder_script_name="folder_organizer.sh"

PS3="Please, which script do you want to run? "
select script in "$stale_script_txt" "$folder_script_txt"; do
    case "$REPLY" in 
        1)  bash "$stale_script_name"
            break
            ;;
        2)  bash "$folder_script_name"
            break
            ;;
        ?)  
            echo "Invalid option"
            ;;
    esac 
done

echo "Script \"$script\" performed with success."