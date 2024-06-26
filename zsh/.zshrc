export PATH=$PATH:/home/elliot/.spicetify
export QSG_RENDER_LOOP=basic
export ZSH="$HOME/.oh-my-zsh/"
export DOTFILES="$HOME/dotfiles/"
export NVCONF="$HOME/.config/nvim/"
export ZSHCONF="$HOME/.zsh/"
export MAVEN="$HOME/pent/maven/"
export SCRIPTS="$HOME/pent/scripts/"
ZSH_DISABLE_COMPFIX="true"
ZSH_THEME="custom_endy"
DISABLE_LS_COLORS="true"
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
