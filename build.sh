#!/bin/bash

dotfiles="$(dirname "$(readlink -f "$0")")"

sudo apt update -y && sudo apt full-upgrade -y

sudo apt install git -y

sudo apt install zsh -y

sudo chsh -s /usr/bin/zsh $USER

# install neovim
if command -v nvim &> /dev/null; then
    echo "neovim is installed"
else
    echo "neovim is not installed"
    sudo apt install ninja-build gettext cmake unzip curl build-essential -y

    git clone https://github.com/neovim/neovim

    cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo

    sudo make install

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

fi

sudo apt install nala konsole neofetch xclip -y

sudo cp -r $dotfiles/konsole/. $HOME/
 
sudo cp -r $dotfiles/zsh/. $HOME/

sudo cp -r $dotfiles/ssh/. $HOME/

sudo cp -r $dotfiles/nvim/. $HOME/

git config --global --add oh-my-zsh.hide-dirty 1

set clipboard+=xclip

sudo chmod -R a+rw $HOME/.local/share/nvim/

cd ..

rm -rf neovim

cd $HOME/

curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/0xProto.zip 

mkdir tempora

unzip 0xProto -d tempora

sudo rm tempora/LICENSE tempora/README.md

sudo mv tempora/* /usr/share/fonts/

sudo fc-cache -f -v >/dev/null

cd ..

rmdir $HOME/tempora

rm ~/0xProto.zip

kwriteconfig5 --file konsolerc --group 'Appearance' --key 'Font' '0xProtoNerdFontMono-Regular'

chmod -R u=rwX,go=rX ~/ && chown -R kali:kali ~/

clear 

echo "done"

