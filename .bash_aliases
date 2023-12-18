#!/bin/bash

#---ONLY ON UBUNTU/DEBIAN SYSTEMS---
alias apt='nala'
alias apt-get='nala'
alias sysupdate='sudo nala upgrade -y'
#---ONLY ON UBUNTU/DEBAIN SYSTEMS---

#---SYSTEM---
alias cat='batcat'
alias cp='cp -i'
alias mv='mv -i'
alias rm='trash -v'
alias mkdir='mkdir -p'
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'
#---SYSTEM---

#---FOLDER NAVIGATION---
alias home='cd ~'
alias cd..='cd ..'
#---FOLDER NAVIGATION---

#---FILE/FOLDER LISTING---
alias ls='ls -aFh --color'
alias la='ls -Alh'
alias lf="ls -l | grep -v '^d'"
alias ld="ls -l | grep '^d'"
#---FILE/FOLDER LISTING---

alias codew='code ./.vscode/*.code-workspace'
