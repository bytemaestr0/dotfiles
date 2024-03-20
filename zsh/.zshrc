ZSH_DISABLE_COMPFIX="true"
export ZSH="$HOME/.oh-my-zsh"
export DOTFILES="$HOME/dotfiles"
ZSH_THEME="af-magic"
DISABLE_LS_COLORS="true"
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
source $ZSH/oh-my-zsh.sh
alias python="python3"
alias cdp="cd - > /dev/null"
alias tvim="time nvim"
alias vim="nvim"
alias apt="sudo nala"
alias nala="sudo nala"
alias lal="ls -al"
alias l="ls"
alias sudo='sudo '
export PATH=$PATH:/home/sam/.spicetify
