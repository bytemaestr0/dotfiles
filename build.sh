#!/bin/bash

dotfiles="$(dirname "$(readlink -f "$0")")"
realuser="$USER"

if command -v apt &> /dev/null; then
    update="sudo apt update"
    upgrade="sudo apt upgrade"
    install="sudo apt install"
    remove="sudo apt remove"
    autoyes="-y"
    system="debi"
    sudo apt install -y gh nala
elif command -v pacman &> /dev/null; then
    update="sudo pacman -Sy"
    upgrade="sudo pacman -Su"
    install="sudo pacman -S"
    remove="sudo pacman -Runcs"
    autoyes="--noconfirm"
    system="arch"
else
    echo "no package manager detected"
    exit 1
fi

$update $autoyes && $upgrade $autoyes

$install $autoyes neofetch xclip kconfig git zsh kitty qbittorrent 

$remove $autoyes konsole xterm

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
   
sudo cp -r $dotfiles/konsole/. $HOME/
sudo cp -r $dotfiles/zsh/. $HOME/
sudo cp -r $dotfiles/nvim/. $HOME/
sudo cp -r $dotfiles/plasma/. $HOME/
sudo cp -r $dotfiles/kitty/. $HOME/

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
        rm 0xProto.zip
        echo "font is installed, apply it"
else
  echo "font is installed, apply it"
fi

if [ -d ~/.ssh ]; then
  sudo chmod -R u=rwX,go=rX ~/ && sudo chown -R $realuser:$realuser ~/
  sudo chmod -R 600 ~/.ssh 
  sudo chmod u+x ~/.ssh 
  sudo chmod a+r ~/.ssh/*.pub
else
  :
fi
echo "done."

/bin/zsh
