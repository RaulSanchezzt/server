#!/bin/bash

# Default services to install
services=(
  # "anaconda3" 
  "blockscout" 
  # "code-server" -> Alredy installed
  # "duckdns"  -> Token
  # "duplicati" -> Disks config
  # "file-browser" -> Disks config
  # "ghostfolio" 
  "hardhat" 
  "homarr" 
  # "jellyfin" -> Disks config
  "netdata" 
  # "nextcloud" -> Disks config
  "nginx-proxy-manager" 
  # "odoo" 
  "ouroboros" 
  "pi-hole" 
  "portainer" 
  # "traefik" 
  "truffle" 
  # "uptime-kuma" 
  "vaultwarden" 
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