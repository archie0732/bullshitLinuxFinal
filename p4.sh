#!/bin/bash


while IFS="#" read -r username password expiry_date shell_type; do
    if [ -z "$username" ] || [ -z "$password" ] || [ -z "$expiry_date" ] || [ -z "$shell_type" ]; then
        continue
    fi

    case "$shell_type" in
        bash) shell_path="/bin/bash" ;;
        sh) shell_path="/bin/sh" ;;
        *) 
            echo "未知的 shell 類型：$shell_type，跳過使用者 $username。"
            continue
            ;;
    esac

    if id "$username" &>/dev/null; then
        echo "使用者 $username 已存在，跳過。"
    else
        sudo useradd -m "$username" -s "$shell_path" -e "$expiry_date"
        echo "$username:$password" | sudo chpasswd
    fi
done < mydata.txt 

