#!/bin/bash

#---ONLY ON UBUNTU/DEBIAN SYSTEMS---
alias apt=nala
alias apt-get=nala
alias sysupdate='sudo nala upgrade -y'
#---ONLY ON UBUNTU/DEBAIN SYSTEMS---

#---SYSTEM---
alias cat='batcat'
alias catp='batcat -p'
alias cp='cp -i'
alias mv='mv -i'
alias rm='trash -v'
alias mkdir='mkdir -p'
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'
alias shutdown='sudo shutdown now'
#---SYSTEM---

#---EDITORS---
alias vim=lvim
alias nvim=lvim
alias vimconf='vim ~/.config/lvim/config.lua'
#---EDITORS---

#---FOLDER NAVIGATION---
alias home='cd ~'
alias cd..='cd ..'
#---FOLDER NAVIGATION---

#---FILE/FOLDER LISTING---
alias ls='exa --colour always'
alias ll='ls --long'
alias la='ls --all'
alias lal='la --long'
alias lt='la --tree'
alias llt='lt --long'
#---FILE/FOLDER LISTING---

alias codew='code ./.vscode/*.code-workspace'
alias pyvenvactivate='source ./.venv/bin/activate'
