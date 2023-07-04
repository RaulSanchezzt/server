#!/bin/bash

# Update
sudo apt update -y
sudo apt upgrade -y

# Utilities
sudo apt install -y xfce4 xfce4-goodies xrdp htop vim firefox gparted

# Docker -> https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
sudo apt update -y
sudo apt-get install ca-certificates curl gnupg

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo docker run hello-world

# Bashrc Alias
sudo echo "# Custom Alias" >> /root/.bashrc
sudo echo "alias ndcy='vim docker-compose.yml'" >> /root/.bashrc
sudo echo "alias dcup='docker compose up -d'" >> /root/.bashrc
sudo echo "alias dcdown='docker compose down'" >> /root/.bashrc

# Stop default DNS service
sudo systemctl disable systemd-resolved
sudo systemctl stop systemd-resolved