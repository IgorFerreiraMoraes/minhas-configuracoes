# fedora_version=$(cat /etc/fedora-release | grep -o '[0-9]*') Get Fedora Version

# Make the configuration scripts executable
chmod u+x ./'configuration scripts'/*.sh

./'configuration scripts'/initial_package_config.sh
./'configuration scripts'/install_programs.sh
./'configuration scripts'/gnome_extensions.sh
./'configuration scripts'/theming.sh

sudo rm -r AdobePhotoshop2021.tar.xz allredist.tar.xz CameraRaw_12_2_1.exe customization OpenTabletDriver.rpm
