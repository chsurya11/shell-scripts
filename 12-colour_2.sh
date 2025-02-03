#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE(){
    if [ $1 -ne 0 ]
        echo -e "$2... $R FAILURE"
        exit 1
    else
        echo -e "$2.. $G SUCCESS"
    fi
}

if [ $? -ne 0 ]
then
    echo -e "$R ERROR"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "installing mysql"
else
    echo -e "mysql is already.. $G installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "installing git"
else
    echo -e "GIT is already.. $G installed"
fi