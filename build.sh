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
    sudo apt install -y github-cli
    sudo apt-get install ninja-build gettext cmake unzip curl build-essential
elif command -v pacman &> /dev/null; then
    update="sudo pacman -Sy"
    upgrade="sudo pacman -Su"
    install="sudo pacman -S"
    remove="sudo pacman -Runcs"
    autoyes="--noconfirm"
    system="arch"
    sudo pacman -S base-devel cmake unzip ninja curl
else
    echo "no package manager detected"
    exit 1
fi

$update $autoyes && $upgrade $autoyes

$install $autoyes git zsh kitty qbittorrent 

$remove $autoyes xterm

sudo chsh -s /bin/zsh $USER

# install neovim
if command -v nvim &> /dev/null; then
    echo "neovim is installed"
else
  git clone https://github.com/neovim/neovim
  cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
  git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
fi
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
   
sudo cp -r $dotfiles/konsole/. $HOME/
sudo cp -r $dotfiles/zsh/. $HOME/
sudo cp -r $dotfiles/nvim/. $HOME/
sudo cp -r $dotfiles/kitty/. $HOME/
sudo cp -r $dotfiles/zellij/. $HOME/

git config --global --add oh-my-zsh.hide-dirty 1

sudo chmod -R u=rwX,go=rX ~/ && sudo chown -R $realuser:$realuser ~/
if [ -d ~/.ssh ]; then
  if [ -f ~/.ssh/* ]; then
    sudo chmod -R 600 ~/.ssh 
    sudo chmod u+x ~/.ssh 
    sudo chmod a+r ~/.ssh/*.pub
  else
    :
  fi
else
  :
fi
echo "done."

/bin/zsh
