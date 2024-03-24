#!/bin/bash

dotfiles="$(dirname "$(readlink -f "$0")")"
realuser="$USER"

if command -v apt &> /dev/null; then
    update="sudo apt update"
    upgrade="sudo apt upgrade"
    install="sudo apt install"
    autoyes="-y"
    system="debi"
    sudo apt install -y gh nala
elif command -v pacman &> /dev/null; then
    update="sudo pacman -Sy"
    upgrade="sudo pacman -Su"
    install="sudo pacman -S"
    autoyes="--noconfirm"
    system="arch"
else
    echo "no package manager detected"
    exit 1
fi

$update $autoyes && $upgrade $autoyes

$install $autoyes git zsh

sudo chsh -s /bin/zsh $USER

# install neovim
if command -v nvim &> /dev/null; then
    echo "neovim is installed"
else
    if [ "$system" = "debi" ]; then
        echo "neovim is not installed"
        $install $autoyes ninja-build gettext cmake unzip curl build-essential
        git clone https://github.com/neovim/neovim
        cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
        sudo make install
    else
      $install $autoyes neovim
    fi 
fi
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
   
$install $autoyes konsole neofetch xclip

sudo cp -r $dotfiles/konsole/. $HOME/
sudo cp -r $dotfiles/zsh/. $HOME/
sudo cp -r $dotfiles/nvim/. $HOME/

git config --global --add oh-my-zsh.hide-dirty 1

if [ ! -f "/usr/share/fonts/0xProtoNerdFontMono-Regular.ttf" ]; then
        echo "font is not installed."
        curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/0xProto.zip 
        mkdir tempora
        unzip 0xProto.zip -d tempora
        sudo rm tempora/LICENSE tempora/README.md
        sudo mv tempora/* /usr/share/fonts/
        sudo fc-cache -f -v >/dev/null
        rmdir tempora
        rm ~/0xProto.zip
else
  echo "font is installed, applying"
fi

if command -v apt &>/dev/null; then
    kwriteconfig5 --file konsolerc --group 'Appearance' --key 'Font' '0xProtoNerdFontMono-Regular'
elif command -v pacman &>/dev/null; then
    kwriteconfig5 --file kdeglobals --group "General" --key "fixed" "0xProto Nerd Font Mono,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"
else
    echo "neither apt nor pacman found, exiting."
    exit 1
fi

sudo chmod -R u=rwX,go=rX ~/ && sudo chown -R $realuser:$realuser ~/
sudo chmod 700 ~/.ssh
echo "done."

/bin/zsh
