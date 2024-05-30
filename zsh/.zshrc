ZSH_DISABLE_COMPFIX="true"
ZSH_THEME="custom_endy"
DISABLE_LS_COLORS="true"
source $ZSH/oh-my-zsh.sh
# ENABLE_CORRECTION="true"
plugins=(
  zsh-navigation-tools
	zsh-autosuggestions
	zsh-syntax-highlighting
)
function git_prompt_info() {
    ref=$(git-branch-name -q -h 12 -b 64) || return
    echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${ref}${ZSH_THEME_GIT_PROMPT_CLEAN}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}
export ZSH="$HOME/.oh-my-zsh"
export DOTFILES="$HOME/dotfiles"
export NVCONF="$HOME/.config/nvim/"
alias python="python3"
alias cdp="cd - > /dev/null"
alias tvim="time nvim"
alias lal="ls -al"
alias l="ls"
alias sudo='sudo '
alias py="cd $HOME/pent/python"
alias zellij="zellij --layout $HOME/.config/zellij/zellij.kdl"
alias zedit="nvim $HOME/.config/zellij/zellij.kdl"
alias kedit="nvim $HOME/.config/kitty/kitty.conf"
export PATH=$PATH:/home/elliot/.spicetify
export QSG_RENDER_LOOP=basic
