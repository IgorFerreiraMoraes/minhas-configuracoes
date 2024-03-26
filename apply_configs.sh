# Remove unwanted software
sudo apt purge firefox libreoffice* hypnotix thunderbird hexchat -y
sudo apt autoremove -y
rm -r ~/.config/hexchat

# Update package lists and upgrade existing packages
sudo apt update
sudo apt upgrade -y

# Wine
sudo apt install git -y
sudo dpkg --configure -a
sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
sudo apt update && sudo apt install --install-recommends winehq-stable -y

# Photoshop
wget https://github.com/LinSoftWin/Photoshop-CC2022-Linux/releases/download/2.1.3/photoshop2021install.sh
sh ./photoshop2021install.sh ~/Programs
rm photoshop2021install.sh
curl -L "https://download.adobe.com/pub/adobe/photoshop/cameraraw/win/12.x/CameraRaw_12_2_1.exe" > CameraRaw_12_2_1.exe
WINEPREFIX=~/Programs/Adobe-Photoshop wine CameraRaw_12_2_1.exe

# NPM
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
nvm install --lts

# Figma Agent
bash -c "$(curl -fsSL https://raw.githubusercontent.com/neetly/figma-agent-linux/main/scripts/install.sh)"
/usr/bin/google-chrome-stable --user-agent="Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36" %U

# Open Tablet Driver
wget https://github.com/OpenTabletDriver/OpenTabletDriver/releases/latest/download/OpenTabletDriver.deb
sudo apt install ./OpenTabletDriver.deb
rm OpenTabletDriver.deb

# NeoVim
sudo apt install g++
wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

# Google
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y
rm google-chrome-stable_current_amd64.deb 

# GitHub
wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'
sudo apt update && sudo apt install github-desktop

# Nautilus
sudo apt install nautilus -y
sudo apt install nautilus-extension-gnome-terminal

# Orchis-light theme
git clone https://github.com/vinceliuice/Orchis-theme.git
cd Orchis-theme
./install.sh -t default -c light -s standard -l --tweaks solid nord

# Tela-circle icon theme
cd ..
git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
cd Tela-circle-icon-theme
./install.sh nord

# Graphite-dark-cursor
cd ..
git clone https://github.com/vinceliuice/Graphite-cursors.git
cd Graphite-cursors
./install.sh
mkdir -p ~/.icons/
sudo mv ~/.local/share/icons/Graphite-* ~/.icons/

# Apply Themes
gsettings set org.cinnamon.theme name "Orchis-Light-Nord"
gsettings set org.cinnamon.desktop.interface gtk-theme "Orchis-Light-Nord"
gsettings set org.cinnamon.desktop.interface icon-theme "Tela-circle-nord-light"
gsettings set org.cinnamon.desktop.interface cursor-theme "Graphite-dark-nord-cursors"
xdg-mime default org.gnome.Nautilus.desktop inode/directory

# Apply Neovim configuration
cd ..
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
