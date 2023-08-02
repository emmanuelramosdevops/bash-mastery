#!/bin/bash
logs=$(curl -s https://coderbyte.com/api/challenges/logs/web-logs-raw)

IFS=
while read -r line; do
  if [[ $line == *coderbyte\ heroku/router* ]]; then
    request_id=$(echo "$line" | awk -F 'request_id=' '{print $2}' | awk '{print $1}')
    
    fwd=$(echo "$line" | awk -F 'fwd="' '{print $2}' | awk -F '"' '{print $1}')

    if [[ $fwd == "MASKED" ]]; then
      echo "$request_id [M]" 
    else 
      echo "$request_id [$fwd]"
    fi
  fi
done <<< "$logs"