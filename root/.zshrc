export PATH=$PATH:/home/elliot/.spicetify
export PATH=$PATH:~/.cargo/bin/
export QSG_RENDER_LOOP=basic
export ZSH="$HOME/.oh-my-zsh/"
export DOTFILES="$HOME/dotfiles/"
export NVCONF="$HOME/.config/nvim/"
export ZSHCONF="$HOME/.zsh/"
export MAVEN="$HOME/pent/maven/"
export SCRIPTS="$HOME/pent/scripts"
export TOOLKIT="$HOME/pent/toolkit/"
export SUDO_EDITOR=/usr/local/bin/nvim
ZSH_DISABLE_COMPFIX="true"
ZSH_THEME="classyTouchroot"
DISABLE_LS_COLORS="false"
plugins=(
  zsh-navigation-tools
	zsh-autosuggestions
	zsh-syntax-highlighting
)
#aliases:
source $HOME/.zsh/aliases.sh
#functions:
source $HOME/.zsh/functions.sh
#omz shell:
source $ZSH/oh-my-zsh.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

