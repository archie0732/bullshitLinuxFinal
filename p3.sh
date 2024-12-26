#!/bin/bash

count=0

while IFS=':' read -r name gender age; do
    if [[ "$gender" == "male" && $age -ge 18 && $age -le 25 ]]; then
        count=$((count + 1))
        echo "$count. $name $gender $age"
    fi
done < dating.txt
