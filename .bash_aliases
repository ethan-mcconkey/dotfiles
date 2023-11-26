#!/bin/bash

alias sysupdate='sudo nala update && sudo nala upgrade -y && sudo nala autoremove -y'
alias apt='nala'
alias apt-get='nala'
alias cls='clear'
alias vim='lvim'
alias nvim='lvim'
alias cat='batcat'
alias grep="/usr/bin/grep $GREP_OPTIONS"
alias ebrc='edit ~/.bashrc'
alias cp='cp -i'
alias mv='mv -i'
alias rm='trash -v'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'
alias apt-get='sudo apt-get'
alias multitail='multitail --no-repeat -c'
alias freshclam='sudo freshclam'
alias vi='nvim'
alias svi='sudo vi'
alias vis='nvim "+set si"'
alias home='cd ~'
alias cd..='cd ..'
alias rmd='/bin/rm  --recursive --force --verbose '
alias la='ls -Alh'
alias ls='ls -aFh --color=always'
alias lx='ls -lXBh'
alias lk='ls -lSrh'
alias lc='ls -lcrh'
alias lu='ls -lurh'
alias lr='ls -lRh'
alias lt='ls -ltrh'
alias lm='ls -alh |more'
alias lw='ls -xAh'
alias ll='ls -Fls'
alias labc='ls -lap'
alias lf="ls -l | egrep -v '^d'"
alias ldir="ls -l | egrep '^d'"
alias f="find . | grep "
alias checkcommand="type -t"
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'
alias whatismyip="whatsmyip"
alias codew='code ./.vscode/*.code-workspace'