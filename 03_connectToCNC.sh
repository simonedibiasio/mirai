#!/bin/bash

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

sudo telnet 192.168.1.9 23 # cnc IP
printf "\n\n"
echo ----------------------------------------------------
read -n 1 -s -r -p "Press any key to continue"
