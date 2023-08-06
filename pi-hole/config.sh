#!/bin/bash

# Stop default DNS service
sudo systemctl disable systemd-resolved
sudo systemctl stop systemd-resolved