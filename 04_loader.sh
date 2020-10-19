#!/bin/bash
cd /home/kali/Desktop/myMirai/MiraiSourceCode/loader
sudo bash ./build.debug.sh &> /dev/null
cat ./file.txt | ./loader.dbg | tee /home/kali/Desktop/outputDBG.txt
printf "\n\n"
echo ----------------------------------------------------
read -n 1 -s -r -p "Press any key to continue"
