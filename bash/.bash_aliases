### Aliases ###


# Editing
alias rm='rm -i'
alias cp='cp -v'
alias mv='mv -v'
alias e='nvim'
alias fe='nvim -p $(fzf -m)'
alias cdf='cd $(find . -type d -print | fzf)'

# Package Management (DNF)
alias up='sudo dnf upgrade'
alias add='sudo dnf install'
alias rem='sudo dnf remove'
# alias clean='sudo dnf autoremove'
alias sr='dnf search'

# Navigation
alias ls='lsd -l'
alias lt='ls --tree'

# Weather
alias we='/home/yeti/Documents/weather/wttr'

# Extra
alias x='exit'
alias down='youtube-dl -x --audio-format mp3'
alias discord='flatpak run com.discordapp.Discord'
