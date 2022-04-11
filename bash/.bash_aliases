### Aliases ###


# Editing
alias rm='rm -i'
alias cp='cp -vi'
alias mv='mv -vi'
alias e='nvim'
alias py='python3'

# Fuzzy Stuff
alias cdf='cd $(find . -type d -print | fzf)'
alias pfzf='fzf --preview "bat --style=numbers --color=always --line-range :500 {}"'
alias fe='nvim -p $(pfzf -m)'
alias hfzf='rg --files --hidden -g "!.git" | pfzf'
alias hfe='nvim -p $(hfzf -m)'

# Package Management (DNF)
alias up='sudo dnf upgrade'
alias add='sudo dnf install'
alias rem='sudo dnf remove'
# alias clean='sudo dnf autoremove'
alias sr='dnf search'

# ssh
alias sshgh='eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_ed25519'

# Navigation
alias ls='exa -1Flghm --icons --octal-permissions --git'
alias lsa='exa -1Flghma --icons --octal-permissions'
alias lt='exa -T --icons'

# Weather
alias we='/home/yeti/Documents/weather/wttr'

# Extra
alias x='exit'
alias down='youtube-dl -x --audio-format mp3'
alias discord='flatpak run com.discordapp.Discord'
