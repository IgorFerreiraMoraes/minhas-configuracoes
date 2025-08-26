# Configure Repositories
flatpak remote-delete fedora
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update --appstream

# Remove Unwanted Programs
sudo rpm-ostree override remove \
  firefox \
  firefox-langpacks \
  gnome-tour \
  gnome-user-docs
sudo rpm-ostree cleanup -m

# Upgrade System
sudo rpm-ostree update
flatpak update -y
sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates
sudo fwupdmgr update

# Disable NetworkManager wait-online
sudo systemctl disable NetworkManager-wait-online.service
