local current_dir='%{$fg[red]%}[%{$reset_color%}%~% %{$fg[red]%}]%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'


PROMPT="%(?,%{$fg[red]%}┌─╼[$USER💀$HOST]-${current_dir}%{$reset_color%}${git_branch}
%{$fg[red]%}└╼%{$reset_color%}$ ,%{$fg[red]%}┌─╼[$USER💀$HOST]-${current_dir}%{$reset_color%}${git_branch}
%{$fg[red]%}└╼%{$reset_color%}$ "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="] %{$reset_color%}"
