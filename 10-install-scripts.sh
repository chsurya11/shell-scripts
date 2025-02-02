#!bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
  echo "Error:: You must have a sudo acess to execute this script"
  exit 1 #other than 0
fi

#SUCCESS=0 , FAILURE=1

dnf list installed mysql

if [ $? -ne 0 ] # $?=1(False),$?=0(True)
then #not installed 
    dnf install mysql -y #If false exceute this command
    if [ $? -ne 0 ] # $?=0,True
    then 
        echo "Installing mysql..Failure"
        exit 1
    else
        echo "Installing myql..SUCCESS" # $?=0,True,If True exceute this command
    fi
else 
    echo "Mysql is already installed" # $?=0(True),Exceute this command
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
    fi
else
    echo "Git is already installed"
fi