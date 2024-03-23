#!/bin/bash

dotfiles="$(dirname "$(readlink -f "$0")")"

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
	exit
fi

$update $autoyes && $upgrade $autoyes

$install $autoyes git zsh

sudo chsh -s /bin/zsh $USER

# install neovim
if command -v nvim &> /dev/null; then
    echo "neovim is installed"
else
    if [$system == "debi"]; then
    	echo "neovim is not installed"
    	$install $autoyes ninja-build gettext cmake unzip curl build-essential
 	    git clone https://github.com/neovim/neovim
    	cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
    	sudo make install
    	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    else 
	    $install $autoyes neovim
    fi
fi

$install $autoyes konsole neofetch xclip

sudo cp -r $dotfiles/konsole/. $HOME/
 
sudo cp -r $dotfiles/zsh/. $HOME/

sudo cp -r $dotfiles/ssh/. $HOME/

sudo cp -r $dotfiles/nvim/. $HOME/

git config --global --add oh-my-zsh.hide-dirty 1

set clipboard+=xclip

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

chmod -R u=rwX,go=rX ~/ && chown -R $USER:$USER ~/

echo "done"

/bin/zsh

