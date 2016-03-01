#!/bin/bash
source conf/rpc.conf

# Targets
if [ -z "$targets" ]; then
    read -r -p "Target IP addresses (space separated): " targets
fi
# Username
if [ -z "$username" ]; then
    read -r -p "Username: " username
fi
# Password
if [ -z "$password" ]; then
    read -s -r -p "Password: " password
fi

echo; echo; echo
for target in $targets; do
    echo "Shutting down $target via net rpc"
    net rpc -S $target -U "$username%$password" shutdown -t 1 -f | grep -v "^$"
    echo; echo
done
