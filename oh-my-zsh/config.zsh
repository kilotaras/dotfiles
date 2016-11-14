antigen use oh-my-zsh
antigen theme robbyrussell

# force apply here so we can override with scripts after that
antigen apply

local ret_status="%(?:%{$fg[green]%}:%{$fg[red]%}%s)"

PROMPT='
${ret_status}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)$(hg_prompt_info)%{$reset_color%}
${ret_status}$%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[cyan]%}git:%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""


hg_prompt_info() {
    STATUS="%{$fg[yellow]%}<status>"
    BRANCH="%{$fg_bold[red]%}<branch>"
    hg prompt --angle-brackets "%{$fg_bold[cyan]%} hg: ${BRANCH}${STATUS}" 2>/dev/null
  }

current_time() {
    date +%H:%M:%S
}
RPROMPT="%{$fg_bold[green]%}$(current_time)%{$reset_color%}"
