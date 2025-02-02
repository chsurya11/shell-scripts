#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2..FAILURE"
    else
        echo "$1..SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR: you must have a sudo access to execute this script"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
    then
        dnf install mysql -y 
        VALIDATE $? "Installing..MYSQL" 
    else
        echo "MYSQL is already...installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing...GIT"
else
    echo "GIT is already..installed"
fi