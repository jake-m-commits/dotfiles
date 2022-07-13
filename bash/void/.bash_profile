# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc


# User specific environment and startup programs
export EDITOR="nvim"
export FLASK_APP="run.py"
export FLASK_ENV="development"
export BAT_THEME='gruvbox-dark'
# export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git"'
export FZF_DEFAULT_OPTS='--border'

# export SUDO_PROMPT="sudo password as $USER: "

# rust env
. "$HOME/.cargo/env"
