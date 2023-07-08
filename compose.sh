#!/bin/bash

# Default services to install
services=(
  "blockscout" 
  # "code-server" -> Alredy installed
  "duckdns" 
  "duplicati" 
  # "ghostfolio" 
  "netdata" 
  "nextcloud" 
  "nginx-proxy-manager" 
  # "odoo" 
  "ouroboros" 
  "pi-hole" 
  "portainer" 
  # "traefik" 
  "truffle" 
  "vaultwarden" 
  "wireguard" 
  # "wordpress"
  )

for service in ${services[@]}; do
  if [ -f "$service/docker-compose.yml" ]; then
    echo "Starting $service"
    (cd "$service" && docker compose up -d)
    echo "========================================================"
  fi
done