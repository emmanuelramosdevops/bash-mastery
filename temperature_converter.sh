#!/bin/bash

# Author: Emmanuel Ramos
# Date Created: 08/03/2023
# Last Modified: 08/03/2023

# Description
# Converts Celsius to Fahrenheit and the inverse.

# Usage:
# Celsius to Fahrenheit = ./temperature_converter.sh -c <number>
# Fahrenheit to Celsius = ./temperature_converter.sh -f <number>

while getopts "f:c:" opt; do
    case $opt in 
        f)  result=$(echo "scale=2; ($OPTARG -32) * (5 / 9)" | bc) 
            break
            ;;
        c)  result=$(echo "scale=2; ($OPTARG * (9 / 5)) + 32" | bc) 
            break
            ;;
        \?) echo "Nothing done..."
            ;;
    esac
done

echo "Temperature is: $result$([[ $opt == "f" ]] && echo "°C" || echo "°F")"