#!/bin/bash

# Default services to install
services=(
  # "anaconda3" 
  # "blockscout" 
  # "code-server" -> Alredy installed
  # "duckdns"  -> Token
  # "duplicati" -> Disks config
  # "ghost" 
  # "file-browser" -> Disks config
  # "ghostfolio" 
  # "hardhat" 
  "homarr" 
  # "jellyfin" -> Disks config
  # "mongodb" 
  # "n8n" 
  "netdata" 
  # "nextcloud" -> Disks config
  # "odoo" 
  # "ouroboros" 
  "pi-hole" 
  "portainer" 
  # "traefik" 
  # "truffle" 
  # "uptime-kuma" 
  "vaultwarden" 
  "watchtower" 
  "wireguard" 
  # "wordpress"
  )

for service in ${services[@]}; do
  if [ -f "$service/docker-compose.yml" ]; then
    echo "Starting $service"
    (cd "$service" && sudo docker compose up -d)
    echo "========================================================"
  fi
done