#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%h-%m-%S)
LOG_FILE_NAME="$LOGS_FOLEDER/$LOG_FILE-$TIMESTAMP.log"


VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo  -e "$2... $R FAILURE"
        exit 1
    else
        echo -e "$2...$G SUCCESS"
    fi
}


echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1 #other than 0
fi

for package in $@
do
   dnf list install $package &>>$LOG_FILE
   if [ $? -ne 0]
   then
       dnf install $package -y &>>$LOG_FILE
       VALIDATE $? "Installing $package"
    else
       echo -e "$package is already $Y ...INSTALLED $N"
    fi
    
done