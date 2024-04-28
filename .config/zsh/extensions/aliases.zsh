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
alias nvimconf='nvim ~/.config/nvim'
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

alias l='eza -a -F=always --icons=always --group-directories-first --sort=name'
alias la='l -1'
alias ll='l -l -h --no-time --no-user'
alias lt='l -T -I=".git"'
alias lf='la -f'
alias ld='la -D'

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
    cd $1
  else
    mkdir -p $1
    cd $1
  fi
}

function full_speedtest() {
  local print = function() {
    echo "------------------------------------------"
    echo $1
    echo "------------------------------------------"
  }

  print("$(speedtest --simple)")
}
# -------------------------------
