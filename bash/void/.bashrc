# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


### yeti additions ###
export PATH=$HOME/.local/bin:$HOME/bin:$PATH
export TERM="xterm-256color"
eval "$(starship init bash)"

# Aliases
if [ -f ~/.bash_alias ]; then
  . ~/.bash_alias
fi

# Functions
if [ -f ~/.bash_func ]; then
  . ~/.bash_func
fi

# Git Aliases/Functions
if [ -f ~/.bash_alias_git ]; then
    . ~/.bash_alias_git
fi

# rust env
. "$HOME/.cargo/env"


### Other ###
# neofetch
colorscript -r
# pfetch
# cpipes
