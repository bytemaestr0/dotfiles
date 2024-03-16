#!/bin/bash

dotfiles="$(dirname "$(readlink -f "$0")")"

sudo apt update -y && sudo apt full-upgrade -y

sudo apt install git -y

sudo apt install zsh -y

sudo apt-get install ninja-build gettext cmake unzip curl build-essential -y

sudo chsh -s /usr/bin/zsh $USER

git clone https://github.com/neovim/neovim

cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo

sudo make install

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

sudo cp -r $dotfiles/konsole/. $HOME/
 
sudo cp -r $dotfiles/zsh/. $HOME/

sudo cp -r $dotfiles/ssh/. $HOME/

sudo cp -r $dotfiles/nvim/. $HOME/

cd ..

rm -rf neovim

clear 

echo "done"

