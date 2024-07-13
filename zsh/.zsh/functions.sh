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
function catall() {
  for file in *; do
    if [ -f "$file" ]; then
        cat "$file"
    fi
  done
}
function getlindir() {
  catall | wc -l
}
function getwindir() {
  catall | wc -w
}
function getcindir() {
  catall | wc -c
}
function comnl() {
  sed 's/, /\n/g' "$1" > "$1.tmp" && cat "$1.tmp" && mv "$1.tmp" "$1"
}
function datefile() {
  if [ -z "$1" ]; then
    echo "Usage: datefile <filename>"
    return 1
  fi
  
  filename="$1"
  
  catall | grep -E '\b[0-9]{4}\b' > "$filename"
}
function mkdir() {
  /bin/mkdir $1 
  cd $1
}
function qemuconv() {
  if [ -z "$1"]; then
    echo "Usage: qemuconv <filename>"
    return 1 
  fi 
  reverse=$(echo $1 | rev)
  extension=$(echo $1 | cut -d'.' -f2)
  clear
  if [ $extension = "7z" ]; then
    7z e $1
  elif [ $extension = "gzip" ]; then  
    gzip -d $1 
  elif [ $extension = "zip" ]; then
    unzip $1 
  fi 
  rm $1 
  qemu-img convert -f vmdk -O qcow2 "*.vmdk" "${name}.qcow2"
  rm "*.vmdk"
}
function merge_files() {
  python $HOME/pent/python/merge_files.py
}
