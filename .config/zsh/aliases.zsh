#!/bin/zsh

# ---------- SYSTEM ----------
alias sysupdate='sudo nala upgrade -y'
alias cat='bat'
alias catp='bat -p'
alias cp='cp -i'
alias mv='mv -i'
alias rmt='rmtrash -v'
alias mkdir='mkdir -p'
alias shutdownsafe='sudo shutdown now'
alias shutdownforce='sudo shutdown -n now'

alias fix='fuck'
# ----------------------------

# ---------- EDITORS ----------
alias -s {zsh, py, rs, txt, md, toml, yml}=nvim
# -----------------------------

# ---------- TMUX ----------
alias mux="tmuxinator"
# --------------------------

# ---------- NAVIGATION ---------- 
alias cd-='cd -'
# ---------- NAVIGATION ---------- 

# ---------- FILE/FOLDER LISTING ----------
alias rg='rg --color=always'
alias grep='rg'

alias l='exa -a -F --icons --group-directories-first --sort=name'
alias la='exa -a -F --icons --group-directories-first --sort=name -1'
alias ll='exa -a -F --icons --group-directories-first --sort=name -l -h --no-time --no-user'
alias lt='exa -a -F --icons --group-directories-first --sort=name -T'
alias lf='exa -a -F --icons --group-directories-first --sort=name -1 | rg -v /'
alias ld='exa -a -F --icons --group-directories-first --sort=name -1 | rg /'

alias stow='stow --verbose'
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
function mkcd() {
  if [[ -d $1 ]]; then
    z $1
  else
    mkdir -p $1
    z $1
  fi
}

function ltx () {
  if [[ -z $1 ]]; then
    lt
  else
    lt -L $1
  fi
}
# -------------------------------
