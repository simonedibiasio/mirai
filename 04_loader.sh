#!/bin/bash

# setting path to Mirai source Folder
pathToMirai=/home/kali/Desktop/MiraiRepository/mirai/MiraiSourceCode
export pathToMirai

cd $pathToMirai/loader
sudo bash ./build.debug.sh &> /dev/null
cat ./file.txt | ./loader.dbg | tee /home/kali/Desktop/outputDBG.txt
printf "\n\n"
echo ----------------------------------------------------
read -n 1 -s -r -p "Press any key to continue"
