
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="amuse"

plugins=(git autojump virtualenvwrapper pip zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


local ret_status="%(?:%{$fg[green]%}:%{$fg[red]%}%s)"

PROMPT='
${ret_status}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)$(hg_prompt_info)%{$reset_color%}
$ '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[cyan]%}git:%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""


hg_prompt_info() {
     hg prompt --angle-brackets "%{$fg_bold[cyan]%} hg:%{$fg_bold[red]%}<branch>" 2>/dev/null
  }
