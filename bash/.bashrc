# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

### yeti additions ###

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

# append to /etc/inputrc for case insensitive tab completions
# set completion-ignore-case on

### Other ###
# neofetch
# pfetch
# colorscript random
