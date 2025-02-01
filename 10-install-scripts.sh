#!bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
 then
  echo "Error:: You must have a sudo acess to execute this script"
fi

dnf install mysql -y

if [ $USERID -ne 0 ]
 then 
   dnf install mysql -y
   if [ $? -ne 0 ]
     then 
      echo "Installing mysql..Failure"
     else
      echo "Installing myql..SUCCESS"
    fi
  else
    echo "mysql is already..installed"
fi