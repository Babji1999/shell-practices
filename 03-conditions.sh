#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "error: please run this script with root access"
    exit 1
else 
    echo "you are running with root access"
fi

VALIDATE() {
    if [ $1 -eq 0 ]
    then 
        echo "installing $2 is ----success"
    else
        echo "installing $2 is ''''' failure"
        exit 1
    fi    
}

dnf list installed nginx
   if [ $? -ne 0 ]
   then
        echo "nignix is not installed"
        dnf install nginx -y
        VALIDATE $? "nginx"
   else
   
   echo "nginx is already installed"
fi