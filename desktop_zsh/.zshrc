### OMZ Setup ###
# Path to your oh-my-zsh installation.
export ZSH="/home/yeti/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="avit"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 10

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  git
  autojump
  urltools
  bgnotify
  zsh-autosuggestions
  zsh-syntax-highlighting
  jovial
  macos
)

source $ZSH/oh-my-zsh.sh


### Japanese input ###
export GTK_IM_MODULE='ibus'
export QT_IM_MODULE='ibus'
export XMODIFIERS=@im='ibus'
#Toolbar for anthy
ibus-daemon -drx


### fnm ###
export PATH=/home/yeti/.fnm:$PATH
eval "`fnm env`"

source /etc/default/locale


### Aliases ###
# For a full list of active aliases, run `alias`.
if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi


### My Prompt ###
# PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '


### pfetch ###
PF_INFO="ascii title os kernel uptime pkgs memory" pfetch
# neofetch and uwufetch also available
