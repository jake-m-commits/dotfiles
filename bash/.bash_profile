# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export TERM="xterm-256color"
export EDITOR="nvim"
export FLASK_APP="run.py"
export FLASK_ENV="development"
# already gets exported in ~/.bashrc
# export PATH=/home/yeti/.local/bin:/home/yeti/bin:$PATH
export BAT_THEME='gruvbox-dark'
export FZF_DEFAULT_OPTS='--border'
