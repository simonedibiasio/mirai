#!/bin/bash

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

sudo service mysql start
sudo service apache2 start
sudo service ssh start

# setting path to Mirai source Folder
pathToMirai=/home/kali/Desktop/MiraiRepository/mirai/MiraiSourceCode
export pathToMirai

# launching cnc
$pathToMirai/mirai/debug/cnc
