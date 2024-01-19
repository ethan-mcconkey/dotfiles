#!/bin/zsh

# ---------- SYSTEM ----------
alias sysupdate='sudo nala upgrade -y'
alias cat='batcat'
alias catp='batcat -p'
alias cp='cp -i'
alias mv='mv -i'
alias rm='trash -v'
alias mkdir='mkdir -p'
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'
alias shutdownsafe='sudo shutdown now'
alias shutdownforce='sudo shutdown -n now'
# ----------------------------

# ---------- EDITORS ----------
alias vi=nvim
alias vim=nvim
# -----------------------------

# ---------- NAVIGATION ---------- 
alias cd='z'
alias cd..='z ..'
alias z..='z ..'
# ---------- NAVIGATION ---------- 

# ---------- FILE/FOLDER LISTING ----------
alias l='exa --sort=name --icons --classify --color=always'
alias la='l --all'
alias ll='l --long --header'
alias lal='l --all --long --header'
alias lt='l --tree'
alias lt1='lt --level=1'
alias lt2='lt --level=2'
alias lt3='lt --level=3'
alias lg='lal --git'
alias lf='la | grep -v /'
alias ld='la | grep /'

alias find='fzf'
# -----------------------------------------

# ---------- GIT ---------- 
alias gc='git clone'
alias gp='git pull'
alias gpu='git push'
alias gs='git status'
alias gcm='git commit -m'
alias ga='git add'
alias gaa='git add -A'
alias gl='git log'
alias gd='git diff'
# ------------------------- 

# ---------- FUNCTIONS ----------
mkcd() {
  if [[ -d $1 ]]; then
    cd $1
  else
    mkdir -p $1
    cd $1
  fi
}
# -------------------------------
