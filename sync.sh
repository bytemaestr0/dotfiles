#!/bin/bash

source_dir="$HOME/dotfiles"
dest_dir="$HOME"

compare_directories() {
    local app_dir="$1"
    local app_name=$(basename "$app_dir")
    local config_dir="$app_dir.config"
    local local_share_dir="$app_dir.local/share"

    if [ -d "$config_dir/$app_name" ]; then
        echo "Source Directory: $config_dir/$app_name"
        echo "Destination Directory: $HOME/.config/$app_name"
        sync_directories "$config_dir/$app_name" "$HOME/.config/$app_name"
    fi

    if [ -d "$local_share_dir/$app_name" ]; then
        echo "Source Directory: $local_share_dir/$app_name"
        echo "Destination Directory: $HOME/.local/share/$app_name"
        sync_directories "$local_share_dir/$app_name" "$HOME/.local/share/$app_name"
    fi
}

sync_directories() {
    local source="$1"
    local dest="$2"
    local temp_diff=$(diff -qr "$source" "$dest")

    rsync -a "$dest"/ "$source"
}

for app_dir in "$source_dir"/*/; do
    compare_directories "$app_dir"
done
