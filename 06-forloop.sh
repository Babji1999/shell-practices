#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
LOGFOLDER="/var/log/shellscript"
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE="$LOGFOLDER/$SCRIPTNAME.log
PACKAGES=("mysql" "python" "ngnix" "httpd")

mkdir -p $LOGFOLDER
echo "script started executing at: $(date)" | tee -a $LOGFILE