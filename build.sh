#!/bin/bash

get_selected_directories() {
    selected_dirs=()
    for dir in "${dirs[@]}"; do
        if grep -q "$dir" "$temp_file"; then
            selected_dirs+=("$dir")
        fi
    done
}

confirmation_dialog() {
    selected_str=$(printf "%s " "${selected_dirs[@]}")
    dialog --yesno "Are you sure you want to copy the following directories to /home/sam?\n\n$selected_str" 10 60
}

dir=~/.dotfiles

temp_file=$(mktemp /tmp/dialog.XXXXXX) || exit 1

dirs=("$dir"/*)
filtered_dirs=()
for d in "${dirs[@]}"; do
    if [ "$(basename "$d")" != "README.md" ] && [ "$(basename "$d")" != "build.sh" ]; then
        filtered_dirs+=("$d")
    fi
done

options=()
for d in "${filtered_dirs[@]}"; do
    options+=("$d" "" on)
done

dialog --checklist "Select directories to copy to /home/sam" 20 60 10 "${options[@]}" 2> "$temp_file"

if [ $? -ne 0 ]; then
    echo "Operation canceled."
    rm -f "$temp_file"
    clear
    exit 0
fi

get_selected_directories

if confirmation_dialog; then
    for selected_dir in "${selected_dirs[@]}"; do
        cp -rT "$selected_dir" /home/sam/ >/dev/null 2>&1
    done
else
    echo "Operation canceled."
fi

rm -f "$temp_file"
clear
