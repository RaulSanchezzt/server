#!/bin/bash

# Default phone region
sudo docker exec --user www-data -it App php occ config:system:set default_phone_region --value=“ES”

# Add Trusted Domain
# sudo docker exec -it App php occ config:system:set trusted_domains 2 --value=cloud.x.com

# Restart container
sudo docker restart App

# https://docs.nextcloud.com/server/latest/admin_manual/configuration_server/occ_command.html#config-commands