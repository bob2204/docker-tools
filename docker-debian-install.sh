#!/bin/bash
#
# Installation de docker sur Debian
#
# 2022-09-22
#

apt update
apt install -y curl gpg curl
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor --batch -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
apt update
apt install -y docker-ce
