#!/bin/bash

echo -n "Enter username: "
read USERNAME
echo -n "Enter password for $USERNAME: "
read -s PASSWORD
echo 
adduser --gecos "" --disabled-login "$USERNAME" && \
echo "$USERNAME:$PASSWORD" | chpasswd && \
usermod -aG sudo "$USERNAME" && \
passwd -e "$USERNAME"


if [ $? -eq 0 ]; then
    echo "User $USERNAME created successfully with sudo privileges."
else
    echo "Failed to create user $USERNAME."
fi
