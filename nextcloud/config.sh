#!/bin/bash

# Default phone region
sudo docker exec --user www-data -it App php occ config:system:set default_phone_region --value=“ES”

# Restart container
sudo docker restart App

# https://docs.nextcloud.com/server/latest/admin_manual/configuration_server/occ_command.html#config-commands