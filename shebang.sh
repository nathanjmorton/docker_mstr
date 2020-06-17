#!/bin/bash

mkdir -p /root/.ssh
chmod 600 /root/.ssh
echo "" > /root/.ssh/authorized_keys
echo "" > /root/.ssh/authorized_keys
chmod 700 /root/.ssh/authorized_keys
apt-get update
apt install git
apt install -y docker.io 
apt install -y docker-compose 

