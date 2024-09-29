# Configure DNF and Repositories
sudo grep -qxF 'max_parallel_downloads=*' /etc/dnf/dnf.conf || echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Remove Unwanted Programs then Upgrade System
sudo dnf remove firefox libreoffice* connections gnome-contacts gnome-maps -y
sudo dnf autoremove -y
sudo dnf upgrade -y --refresh
sudo dnf clean all
