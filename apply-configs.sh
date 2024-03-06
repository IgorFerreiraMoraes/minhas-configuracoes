# Apply Neovim configuration
cp -r nvim ~/.config/

# Apply themes
mkdir -p ~/.fonts
cp -r cinnamon/fonts/* ~/.fonts
cp -r cinnamon/themes/* ~/.themes
cp -r cinnamon/icons/* ~/.local/share/icons
rm ~/.local/share/icons/photoshop.png
fc-cache -f -v
gsettings set org.cinnamon.desktop.interface font-name "Barlow Regular 10"
gsettings set org.nemo.desktop font "Barlow Regular 10"
gsettings set org.gnome.desktop.interface document-font-name "Barlow Regular 10"
gsettings set org.gnome.desktop.interface monospace-font-name "Sono Regular 10"
gsettings set org.cinnamon.desktop.wm.preferences titlebar-font "Barlow Regular 10"
dconf load /org/cinnamon/ < cinnamon/config-files/cinnamon_dconf.txt
gsettings set org.cinnamon.desktop.background picture-uri "file://$HOME/.themes/bg.png"
dconf load /org/gnome/terminal/legacy/profiles:/ < cinnamon/themes/nord-light-profile.dconf
cp -r cinnamon/config-files/0.json ~/.config/cinnamon/spices/menu@cinnamon.org/
cp -r cinnamon/config-files/2.json ~/.config/cinnamon/spices/grouped-window-list@cinnamon.org
cp -r cinnamon/config-files/cinnamon.css ~/.themes/Orchis-Light-Nord/cinnamon/
