### Aliases ###


# Editing
alias rm='rm -i'
alias cp='cp -vi'
alias mv='mv -vi'
alias e='nvim'

# Fuzzy Stuff
alias cdf='cd $(find . -type d -print | fzf)'
alias fe='nvim -p $(fzf -m)'
alias hfzf='rg --files --hidden -g "!.git" | fzf'
alias hfe='nvim -p $(hfzf -m)'
alias pfzf='hfzf --preview "bat --style=numbers --color=always --line-range :500 {}"'

# Package Management (DNF)
alias up='sudo dnf upgrade'
alias add='sudo dnf install'
alias rem='sudo dnf remove'
# alias clean='sudo dnf autoremove'
alias sr='dnf search'

# ssh
alias sshgh='eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_ed25519'

# Navigation
alias ls='lsd -l'
alias lt='ls --tree'

# Weather
alias we='/home/yeti/Documents/weather/wttr'

# Extra
alias x='exit'
alias down='youtube-dl -x --audio-format mp3'
alias discord='flatpak run com.discordapp.Discord'
