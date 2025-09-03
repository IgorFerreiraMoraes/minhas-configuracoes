#!/usr/bin/env bash

# Configure Repositories
flatpak remote-delete fedora
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update --appstream

# Remove Unwanted Programs and Upgrade System
sudo rpm-ostree update \
  --uninstall firefox \
  --uninstall firefox-langpacks \
  --uninstall gnome-tour \
  --uninstall gnome-user-docs
flatpak update -y
sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates
sudo fwupdmgr update

# Disable NetworkManager wait-online
sudo systemctl disable NetworkManager-wait-online.service
