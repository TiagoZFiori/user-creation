#!/bin/bash

while true; do
    echo -e "\nPlease select one of the options:\n0 - List all users\n1 - List specific user\n2 - Add user\n3 - Edit user password\n4 - Delete user\n5 - Close script"
    read user_choice

    case $user_choice in
    0)
        awk -F':' '{print$1}' /etc/passwd
        ;;
    1)
        read -p "Please enter the First and/or Last name of the user. Or the username: " list_filter
        grep "$list_filter" /etc/passwd
        ;;
    2)
        read -p "Enter the username you want to add: " user_info_add
        sudo useradd -m $user_info_add
        sudo passwd $user_info_add
        ;;
    3)
        read -p "Please enter the username: " user_info_edit
        sudo passwd $user_info_edit
        ;;

    4)
        read -p "Enter the username: " user_info_del
        sudo userdel -r $user_info_del
    ;;

    5)
        break
    ;;
    *)
        echo "Invalid option, select an option between 0-5"
    esac
done