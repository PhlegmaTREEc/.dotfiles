#!/usr/bin/env sh
# List of command to run and set up the system
# --------------------------------------------
# Enable timer for weekly trim
systemctl status fstrim.timer
# Enable bluetooth
sudo systemctl enable --now bluetooth
