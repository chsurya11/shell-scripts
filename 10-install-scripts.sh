#!bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
  echo "Error:: You must have a sudo acess to execute this script"
  exit 1 #other than 0
fi

dnf list installed mysql

if [ $? -ne 0 ]
then #not installed 
    dnf install mysql -y
    if [ $? -ne 0 ]
    then 
        echo "Installing mysql..Failure"
        exit 1
    else
        echo "Installing myql..SUCCESS"
    fi
else 
    echo "Mysql is already installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "Installing GIT..Failure"
        exit 1
    else
    echo "Installing GIT..SUCCESS"
else
    echo "Git is already installed"
fi