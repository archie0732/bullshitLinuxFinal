#!/bin/bash


while IFS='#' read -r name passwd endDate shell; do
    if [[ "$gender" == "male" && $age -ge 18 && $age -le 25 ]]; then
        count=$((count + 1))
        echo "$count. $name $gender $age"
    fi
done < mydata.txt
