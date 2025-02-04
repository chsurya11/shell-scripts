#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo -e "$2... $R FAILURE $N"
    else
        echo -e "$2... $G SUCCESS"
    fi
}

echo "script started executing at: $TIMESTAMP" &>>$LOG_FILE

if [ $USERID -ne 0 ]
then
    echo "ERROR: you must have a sudo access to execute this script"
    exit 1
fi

dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ]
then
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "Installing..MYSQL"
else
    echo -e "MYSQL is already ..$Y installed $N"
fi

dnf list installed git &>>$LOG_FILE

if [ $? -ne 0 ]
then
    dnf install git -y &>>$LOG_FILE
    VALIDATE $? "Installing..GIT"
else
    echo -e "GIT is already ..$Y installed"
fi