##############################
# Basic Programs
##############################

	# Flatpak
	flatpak install flathub org.mozilla.firefox --noninteractive
	flatpak install flathub md.obsidian.Obsidian --noninteractive
	flatpak install flathub com.github.tchx84.Flatseal --noninteractive

	# OpenTabletDriver
	wget https://github.com/OpenTabletDriver/OpenTabletDriver/releases/latest/download/OpenTabletDriver.rpm
	sudo dnf install ./OpenTabletDriver.rpm -y
	systemctl --user enable opentabletdriver.service --now

	# Wine
	sudo dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/39/winehq.repo
	sudo dnf install winehq-stable -y --allowerasing

	# Auto CPU Freq
	git clone https://github.com/AdnanHodzic/auto-cpufreq.git
	cd auto-cpufreq && sudo ./auto-cpufreq-installer
	sudo auto-cpufreq --install
	cd ..
	sudo rm -r auto-cpufreq

##############################
# Development
##############################

	# Git && GitHub
	sudo dnf install git
	flatpak install flathub io.github.shiftey.Desktop --noninteractive

	# Neovim
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	chmod u+x nvim.appimage
	sudo mv nvim.appimage /usr/local/bin/nvim
	cp -r nvim ~/.config/
	
	# Node && NPM
	wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
	export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
	nvm install node
	
	# Godot
	flatpak install flathub org.godotengine.Godot --noninteractive
	
##############################
# Design
##############################
	
	# Photoshop
	chmod u+x ./photoshop2021install.sh
	./photoshop2021install.sh ~/.wine
	curl -L "https://download.adobe.com/pub/adobe/photoshop/cameraraw/win/12.x/CameraRaw_12_2_1.exe" > CameraRaw_12_2_1.exe
	WINEPREFIX=~/.wine wine CameraRaw_12_2_1.exe

	# Figma Agent
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/neetly/figma-agent-linux/main/scripts/install.sh)"
