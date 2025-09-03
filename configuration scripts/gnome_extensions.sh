#!/usr/bin/env bash

extension_list=(
    "hidetopbar@mathieu.bidon.ca"
    "paperwm@paperwm.github.com"
)

for extension in "${extension_list[@]}"; do
    VERSION_TAG=$(curl -Lfs "https://extensions.gnome.org/extension-info/?uuid=${extension}" | jq '.shell_version_map | to_entries | map(.value.pk) | max')
    wget -O ${extension}.zip "https://extensions.gnome.org/download-extension/${extension}.shell-extension.zip?version_tag=$VERSION_TAG"
    gnome-extensions install --force ${EXTENSION_ID}.zip
    if ! gnome-extensions list | grep --quiet ${extension}; then
        busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s ${extension}
    fi
    gnome-extensions enable ${extension}
    rm ${extension}.zip
done

dconf load /org/gnome/shell/extensions/ < ./resources/extensions.dconf
