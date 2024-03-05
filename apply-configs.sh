# Apply Neovim configuration
cp -r neovim ~/. local/share/

# Apply themes
mkdir -p ~/.fonts
cp -r cinnamon/fonts/* ~/.fonts
cp -r cinnamon/themes/* ~/.themes
cp -r cinnamon/icons/* ~/.local/share/icons
fc-cache -f -v
gsettings set org.cinnamon.desktop.interface font-name "Barlow Regular 10"
gsettings set org.nemo.desktop font "Barlow Regular 10"
gsettings set org.gnome.desktop.interface document-font-name "Barlow Regular 10"
gsettings set org.gnome.desktop.interface monospace-font-name "Sono Regular 10"
gsettings set org.cinnamon.desktop.wm.preferences titlebar-font "Barlow Regular 10"
cd ~/.themes
dconf load /org/gnome/terminal/legacy/profiles:/ < ~/nord-light-profile.dconf
gsettings set org.cinnamon.desktop.background picture-uri "file://$HOME/.themes/bg.png"


