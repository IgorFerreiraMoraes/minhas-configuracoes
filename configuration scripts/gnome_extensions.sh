# Install Tweaks and Manager
sudo dnf install gnome-tweaks jq -y
flatpak install --noninteractive flathub com.mattjakeman.ExtensionManager

# Define list of extensions to be installed
extension_list=(
    "forge@jmmaranan.com"
    "hidetopbar@mathieu.bidon.ca"
    "user-theme@gnome-shell-extensions.gcampax.github.com"
    "blur-my-shell@aunetx"
)

for extension in "${extension_list[@]}" do
    VERSION_TAG=$(curl -Lfs "https://extensions.gnome.org/extension-query/?search=${extension}" | jq '.extensions[0] | .shell_version_map | map(.pk) | max')
    wget -O ${extension}.zip "https://extensions.gnome.org/download-extension/${extension}.shell-extension.zip?version_tag=$VERSION_TAG"
    gnome-extensions install --force ${EXTENSION_ID}.zip
    if ! gnome-extensions list | grep --quiet ${extension}; then
        busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s ${extension}
    fi
    gnome-extensions enable ${extension}
    rm ${EXTENSION_ID}.zip
done

gnome-extensions refresh

