mkdir customization
cd customization

# Orchis-theme
git clone https://github.com/vinceliuice/Orchis-theme.git
cd Orchis-theme
./install.sh -t default -c light -s standard -l --tweaks solid nord
cp -r ~/.themes/Orchis-Light-Nord/gtk-4.0 ~/.config/gtk-4.0
dconf write /org/gnome/shell/extensions/user-theme/name "Orchis-Light-Nord"
gsettings set org.gnome.desktop.interface gtk-theme "Orchis-Light-Nord"
sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --filesystem=$HOME/.icon
sudo flatpak override --env=GTK_THEME=Orchis-Light-Nord
cd ..

# Mignon Icons
git clone https://github.com/IgorFerreiraMoraes/Mignon-icon-theme.git
cd Mignon-icon-theme
./install.sh
gsettings set org.gnome.desktop.interface icon-theme "Mignon-pastel"
cd..

# Graphite-dark-cursor
git clone https://github.com/vinceliuice/Graphite-cursors.git
cd Graphite-cursors
./install.sh
mkdir -p ~/.icons/
sudo cp -r ~/.local/share/icons/Graphite-* /usr/share/icons
sudo mv ~/.local/share/icons/Graphite-* ~/.icons/
gsettings set org.gnome.desktop.interface cursor-theme "Graphite-dark-nord-cursors"
cd ..
cd ..

# Firefox Theme
curl -s -o- https://raw.githubusercontent.com/rafaelmardojai/firefox-gnome-theme/master/scripts/install-by-curl.sh | bash

# Resources
mkdir -p ~/.fonts
cp -r resources/fonts/* ~/.fonts
gsettings set org.gnome.desktop.interface font-name "Barlow Regular 10"
gsettings set org.gnome.desktop.wm.preferences titlebar-font "Barlow Regular 10"
gsettings set org.gnome.desktop.interface document-font-name "Barlow Regular 10"
gsettings set org.gnome.desktop.interface monospace-font-name "Sono Regular 10"
gsettings set org.gnome.desktop.background picture-uri resources/bg.jpg
gsettings set org.gnome.desktop.background picture-uri-dark resources/bg.jpg
dconf load /org/gnome/terminal/legacy/profiles:/ < resources/themes/nord-light-profile.dconf
