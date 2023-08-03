#!/bin/bash
# Simple Operating System
# Variables
choice=""

# Functions
main_menu(){
    clear
    echo "---------------------------------"
    echo " Main Menu                      -"
    echo "---------------------------------"
    echo "1. System Information"
    echo "2. File Management"
    echo "3. Process Management"
    echo "4. Quit"
    echo "---------------------------------"
    echo -n "Enter your choice [1-4] : "
    read choice
    case $choice in
        1) system_information ;;
        2) file_management ;;
        3) process_management ;;
        4) exit 0 ;;
        *) echo -e "\nInvalid choice"
            main_menu
    esac
}

system_information(){
    clear
    echo "---------------------------------"
    echo " System Information             -"
    echo "---------------------------------"
    echo "1. Show System Information"
    echo "2. Show Disk Information"
    echo "3. Return to Main Menu"
    echo "---------------------------------"
    echo -n "Enter your choice [1-3] : "
    read choice
    case $choice in
        1) system_info ;;
        2) disk_info ;;
        3) main_menu ;;
        *) echo -e "\nInvalid choice"
            system_information
    esac
}

system_info(){
    clear
    echo "---------------------------------"
    echo " System Information             -"
    echo "---------------------------------"
    uname -a
    echo "---------------------------------"
    echo "Press Enter To Return To Menu"
    read
    system_information
}

disk_info(){
    clear
    echo "---------------------------------"
    echo " Disk Information               -"
    echo "---------------------------------"
    df -h
    echo "---------------------------------"
    echo "Press Enter To Return To Menu"
    read
    system_information
}

file_management(){
    clear
    echo "---------------------------------"
    echo " File Management                -"
    echo "---------------------------------"
    echo "1. List Directory Contents"
    echo "2. Create a File"
    echo "3. Delete a File"
    echo "4. Return to Main Menu"
    echo "---------------------------------"
    echo -n "Enter your choice [1-4] : "
    read choice
    case $choice in
        1) list_directory ;;
        2) create_file ;;
        3) delete_file ;;
        4) main_menu ;;
        *) echo -e "\nInvalid choice"
            file_management
    esac
}

list_directory(){
    clear
    echo "---------------------------------"
    echo " Listing Directory Contents     -"
    echo "---------------------------------"
    ls -l
    echo "---------------------------------"
    echo "Press Enter To Return To Menu"
    read
    file_management
}

create_file(){
    clear
    echo "---------------------------------"
    echo " Create File                    -"
    echo "---------------------------------"
    echo -n "Enter file name : "
    read filename
    touch $filename
    echo "File Created"
    echo "---------------------------------"
    echo "Press Enter To Return To Menu"
    read
    file_management
}

delete_file(){
    clear
    echo "---------------------------------"
    echo " Delete File                    -"
    echo "---------------------------------"
    echo -n "Enter file name : "
    read filename
    rm -i $filename
    echo "File Deleted"
    echo "---------------------------------"
    echo "Press Enter To Return To Menu"
    read
    file_management
}

process_management(){
    clear
    echo "---------------------------------"
    echo " Process Management             -"
    echo "---------------------------------"
    echo "1. List Running Processes"
    echo "2. Kill a Process"
    echo "3. Return to Main Menu"
    echo "---------------------------------"
    echo -n "Enter your choice [1-3] : "
    read choice
    case $choice in
        1) list_processes ;;
        2) kill_process ;;
        3) main_menu ;;
        *) echo -e "\nInvalid choice"
            process_management
    esac
}

list_processes(){
    clear
    echo "---------------------------------"
    echo " Listing Running Processes      -"
    echo "---------------------------------"
    ps -a
    echo "---------------------------------"
    echo "Press Enter To Return To Menu"
    read
    process_management
}

kill_process(){
    clear
    echo "---------------------------------"
    echo " Kill a Process                 -"
    echo "---------------------------------"
    echo -n "Enter Process ID : "
    read pid
    kill -9 $pid
    echo "Process Killed"
    echo "---------------------------------"
    echo "Press Enter To Return To Menu"
    read
    process_management
}

# Main Program
while true
do
    main_menu
done