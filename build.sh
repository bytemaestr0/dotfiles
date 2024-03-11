#!/bin/bash

dotfiles="$(dirname "$(readlink -f "$0")")"

sudo apt update -y && sudo apt full-upgrade -y

sudo snap install nvim --classic

sudo apt install zsh -y

sudo chsh -s /usr/bin/zsh $USER

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

sudo cp -r $dotfiles/konsole/. /home/$USER/
 
sudo cp -r $dotfiles/zsh/. /home/$USER/

sudo cp -r $dotfiles/.ssh/. /home/$USER/

sudo cp -r $dotfiles/nvim/. /home/$USER/

clear

echo ""
echo ""
echo ""
echo "done"
echo ""
echo ""
echo ""
