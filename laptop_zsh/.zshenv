# comment this out for default "xterm-kitty"
export TERM="xterm-256color"

# Preferred editors for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi
# export VISUAL='neovide'

# silver-teapot env vars
export FLASK_APP='run.py'
export FLASK_ENV='development'

# golden-shift env vars
export SECRET_KEY='django-insecure-u0fjim+dk_&)!j10td#$45z9n08q7sc=i**#c1%bi^65k%)1q1'
