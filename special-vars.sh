#!bin/bash

echo "all variables passed to the script :$@"
echo "number of variables: $#"
echo "script name: $0"
echo "current Directory: $pwd"
echo "home directory of user: $user"
echo "home directory of user: $home"
echo "PID of the script: $$"
sleep 10 &
echo "PID of last command in the background: $!"