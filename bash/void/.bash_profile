# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

# wayland session setup
# if [ "$(tty)" = "/dev/tty1" ]; then
#   export QT_QPA_PLATFORM=wayland-egl
#   export ELM_DISPLAY=wl
#   export SDL_VIDEODRIVER=wayland
#   export MOZ_ENABLE_WAYLAND=1

#   # start sway
#   exec sway
# fi

# x11 session
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec startx
fi

# user env
export EDITOR="nvim"

export FLASK_APP="run.py"
export FLASK_ENV="development"

export BAT_THEME="gruvbox-dark"
export FZF_DEFAULT_OPTS="--border"

# rust env
. "$HOME/.cargo/env"
