function git_prompt_info() {
    ref=$(git-branch-name -q -h 12 -b 64) || return
    echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${ref}${ZSH_THEME_GIT_PROMPT_CLEAN}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}
function cofi() {
    cat "$1" | xclip -selection clipboard
}
function killbyname() {
    if [ -z "$1" ]; then
        echo "usage: killbyname <process_name>"
        return 1
    fi
    
    process_name=$1
    pids=$(ps -A | grep $process_name | grep -v grep | awk '{print $1}')
    if [ -z "$pids" ]; then
        echo " '$process_name'"
        return 1
    fi
    echo "killing the following processes:"
    echo "$pids"
    echo $pids | xargs kill -9
}
function zlast() {
    last_session=$(zellij list-sessions | head -n 1 | sed 's/\x1b\[[0-9;]*m//g' | awk '{print $1}')
    zellij a $last_session
}

