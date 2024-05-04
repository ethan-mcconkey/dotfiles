#!/bin/zsh

export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export FPATH="$XDG_DATA_HOME/zsh/completions:$FPATH"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg:$XDG_CONFIG_DIRS"

export GPG_TTY=$(tty)
export KEYTIMEOUT=1
export EDITOR=nvim

# ---------------------------------------------- TMUX ----------------------------------------------
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    exec tmux new-session -A -s default -n default
fi

# -------------------------------------------- OPTIONS ---------------------------------------------
setopt autocd
setopt auto_cd

autoload -U colors && colors

# -------------------------------------------- HISTORY ---------------------------------------------
export HISTSIZE=10000
export SAVEHIST=100000
export HISTFILE="$XDG_STATE_HOME/zsh/history"

setopt histignorealldups
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# -------------------------------------------- VI MODE ---------------------------------------------
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

bindkey -v


# -------------------------------------------- PLUGINS ---------------------------------------------
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
if ! fast-theme -s | rg -q catppuccin-mocha; then
  fast-theme XDG:catppuccin-mocha
fi

# -------------------------------------------- APP INIT --------------------------------------------
eval "$(ssh-agent -s)" > /dev/null && ssh-add

export PATH="$XDG_CONFIG_HOME/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH"
export BAT_THEME="Catppuccin-mocha"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PYENV_VIRTUALENV_DISABLE_PROMPT=0
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init --cmd cd zsh)"

export RBENV_ROOT="$XDG_DATA_HOME"/rbenv
eval "$(rbenv init - zsh)"

eval "$(thefuck --alias)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
. $CARGO_HOME/env

export PNPM_HOME="/home/ethan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ------------------------------------------ COMPLETIONS -------------------------------------------
autoload -Uz compinit
compinit

zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache
zstyle ':completion:*:*' matcher-list 'm:{[:lower:]-}={[:upper:]_}' '+r:|[.]=**'

[[ ! -d $XDG_DATA_HOME/zsh/completions ]] && mkdir -p $XDG_DATA_HOME/zsh/completions

[[ ! -f $XDG_DATA_HOME/zsh/completions/_rustup ]] && \
  rustup completions zsh > $XDG_DATA_HOME/zsh/completions/_rustup

[[ ! -f $XDG_DATA_HOME/zsh/completions/_cargo ]] && \
  rustup completions zsh cargo > $XDG_DATA_HOME/zsh/completions/_cargo

[[ ! -f $XDG_DATA_HOME/zsh/completions/_poetry ]] && \
  poetry completions zsh > $XDG_DATA_HOME/zsh/completions/_poetry

[[ ! -f $XDG_DATA_HOME/zsh/completions/_poe ]] && \
  poe _zsh_completion > $XDG_DATA_HOME/zsh/completions/_poe

[[ -f $PYENV_ROOT/completions/pyenv.zsh ]] && source $(pyenv root)/completions/pyenv.zsh

[[ ! -f $XDG_DATA_HOME/zsh/completions/_rg ]] && \
  rg --generate complete-zsh > $XDG_DATA_HOME/zsh/completions/_rg

[[ ! -f $XDG_DATA_HOME/zsh/completions/_tmuxinator ]] && \
  wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -O \
  $XDG_DATA_HOME/zsh/completions/_tmuxinator

eval "$(register-python-argcomplete pipx)"

eval "$(pip completion --zsh)"

# -------------------------------------------- ALIASES ---------------------------------------------
alias sysupdate='sudo nala upgrade -y'
alias cat='bat'
alias cp='cp -i'
alias mv='mv -i'
alias rmt='rmtrash -v'
alias mkdir='mkdir -p'
alias fix='fuck'
alias cd-='cd -'
alias rg='rg --color=always'
alias grep='rg'
alias ls='eza -a -F=always --icons=always --group-directories-first --sort=name -1'
alias la='ls -l -h --no-time --no-user'
alias lt='ls -T -I=".git"'
alias stow='stow --verbose'

# ------------------------------------------- FUNCTIONS --------------------------------------------
function mkcd() {
  if [[ -d $1 ]]; then
    cd $1
  else
    mkdir -p $1
    cd $1
  fi
}

# ----------------------------------------- POWERLEVEL10K ------------------------------------------
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.config/zsh/p10k.zsh ]] || source ~/.config/zsh/p10k.zsh
