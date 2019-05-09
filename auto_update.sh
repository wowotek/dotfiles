#! /bin/bash

CACHE=/tmp/.wtk_au_cache
LOG_FILE=/tmp/.wtk_au.log

echo "Initiating Log File"
echo "    | Removing $LOG_FILE"
rm $LOG_FILE > /dev/null
echo "    | Creating $LOG_FILE"
touch $LOG_FILE
echo ""

echo "Initiating Cache Folder"
echo "    | Removing $CACHE"
rm -rf $CACHE > /dev/null
echo "    | Creating $CACHE"
mkdir $CACHE
echo ""

# Visual Studio Code
echo "Visual Studio Code"
echo "    | Downloading Newest Visual Studio Code"
wget -q https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -O $CACHE/code_latest_amd64.deb >> $LOG_FILE
echo "    | Installing VScode"
dpkg -i $CACHE/code_latest_amd64.deb >> $LOG_FILE
echo "    | Installing Dependencies"
apt-get install -f >> $LOG_FILE

# Finished
# Read LOG File
echo ""
echo "Reading Log File"
cat $LOG_FILE
echo ""


echo "Removing Cache Folder At $CACHE"
rm -rf $CACHE
echo "Removing Log File"
rm $LOG_FILE

