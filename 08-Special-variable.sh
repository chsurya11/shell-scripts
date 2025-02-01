#!/bin/bash

$1, $2, $3
echo "all variables passed: $@"
echo "Number of variables: $#"
echo "Script name: $0"
echo "present working directory: $PWD"
echo "Home directory of current user: $HOME"
echo "Which user is running this script: $USER"
echo "Process ID of current script: $$"
sleep 60 &
echo "Process ID of last command in background: $!"