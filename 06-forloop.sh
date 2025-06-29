#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
LOGFOLDER="/Var/log/shellscript"
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE="$LOGFOLDER/$SCRIPTNAME.log"
PACKAGES=("mysql" "python" "ngnix" "httpd")


mkdir -p $LOGFILE
echo -e "script started executing at: $(date)" | tee -a $LOGFILE

if [ $USERID -ne 0 ]
then
    echo -e "error: please run this script with root access" | tee -a $LOGFILE
    exit 1
else 
    echo -e "you are running with root access" | tee -a $LOGFILE
fi

VALIDATE() {
    if [ $1 -eq 0 ]
    then 
        echo -e "installing $2 is ----success" | tee -a $LOGFILE
    else
        echo -e "installing $2 is ''''' failure" | tee -a $LOGFILE
        exit 1
    fi    
}

for PACKAGES in ${PACKAGES[@]}
do

dnf list installed $PACKAGES &>>$LOGFILE
   if [ $? -ne 0 ]
   then
        echo "$PACKAGES is not installed" | tee -a $LOGFILE
        dnf install $PACKAGES -y &>>$LOGFILE
        VALIDATE $? "$PACKAGES"
   else
   
   echo -e "nginx is already installed" | tee -a $LOGFILE
fi
done