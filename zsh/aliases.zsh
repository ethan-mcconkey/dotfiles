#!/bin/zsh

# SYSTEM 
alias sysupdate='sudo nala upgrade -y'
alias cat='batcat'
alias catp='batcat -p'
alias cp='cp -i'
alias mv='mv -i'
alias rm='trash -v'
alias mkdir='mkdir -p'
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'
alias shutdown='sudo shutdown now'

# EDITORS 
alias vim=lvim
alias vimconf='vim ~/.config/lvim/config.lua'

# NAVIGATION 
alias cd..='cd ..'

# FILE/FOLDER LISTING 
alias ls='exa --colour always'
alias ll='ls --long'
alias la='ls --all'
alias lal='la --long'
alias lt='la --tree'
alias llt='lt --long'

# GIT 
alias gc='git clone'
alias gp='git pull'
alias gpu='git push'
alias gs='git status'
alias gcm='git commit -m'
alias ga='git add'
alias gl='git log'
alias gd='git diff'
