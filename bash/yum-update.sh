#!/bin/bash

local_path="./formatted-pckgs.txt"
log_filename="/var/log/yum-update-$(date +%Y%m%d).log"

sudo touch $log_filename

echo "--------------------------------------------------" | sudo tee -a $log_filename
echo "Run started at `date`" | sudo tee -a $log_filename
echo "Started by `sudo echo $USER`" | sudo tee -a $log_filename
echo "--------------------------------------------------" | sudo tee -a $log_filename

while read NAME
do
    echo "Processing $NAME..." | sudo tee -a $log_filename
    echo sudo yum -y update $NAME | sudo tee -a $log_filename
    echo "" | sudo tee -a $log_filename

done < $local_path

echo "" | sudo tee -a $log_filename
echo "Run completed at `date`" | sudo tee -a $log_filename