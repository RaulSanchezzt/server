#!/bin/bash

# Update
sudo apt update -y
sudo apt upgrade -y

# Utilities
sudo apt install -y xfce4 xfce4-goodies xrdp htop vim gparted gnome-disk-utility fail2ban ntfs-3g

# Docker -> https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
sudo apt update -y
sudo apt-get install -y ca-certificates curl gnupg

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Bashrc Alias
sudo echo "# Custom Alias" >> ~/.bashrc
sudo echo "alias ndcy='vim docker-compose.yml'" >> ~/.bashrc
sudo echo "alias dcup='sudo docker compose up -d'" >> ~/.bashrc
sudo echo "alias dcdown='sudo docker compose down'" >> ~/.bashrc

# Install Code Server
cd code-server
sudo docker compose up -d

# End
echo "Now your system is ready, edit the .env files of the other services on Code.
echo "Then, open the script compose.sh and choose the services you want to start."