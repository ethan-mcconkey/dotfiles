#!/bin/zsh

export DOTFILES_HOME="$HOME/.dotfiles"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg:$XDG_CONFIG_DIRS"

export GPG_TTY=$(tty)
export TERM="xterm-256color"

export STARSHIP_CONFIG=~/.config/starship/starship.toml
export PYENV_ROOT="$HOME/.pyenv"
export NVM_DIR=$XDG_CONFIG_HOME/nvm

path=($HOME/.local/bin/ $HOME/bin $PYENV_ROOT/bin $path)
fpath=($DOTFILES_HOME/zsh/completions $fpath)
cdpath=($HOME/Documents/code $DOTFILES_HOME)

autoload -Uz compinit
compinit

autoload -U bashcompinit
bashcompinit

setopt histignorealldups 
setopt sharehistory
setopt autocd
setopt auto_cd


ZSH_CONFIG="$DOTFILES_HOME/zsh"

if [[ -d $ZSH_CONFIG ]]; then
  if [[ -f $ZSH_CONFIG/plugins.zsh ]]; then
    source $ZSH_CONFIG/plugins.zsh
  fi

  if [[ -f $ZSH_CONFIG/aliases.zsh ]]; then
    source $ZSH_CONFIG/aliases.zsh ]]
  fi

  if [[ -f $ZSH_CONFIG/functions.zsh ]]; then
    source $ZSH_CONFIG/functions.zsh
  fi

  if [[ -f $ZSH_CONFIG/completions.zsh ]]; then
    source $ZSH_CONFIG/completions.zsh
  fi
fi

HISTSIZE=1000
SAVEHIST=10000
HISTFILE="$XDG_CACHE_HOME/zsh_history"

eval "$(starship init zsh)"

eval "$(pyenv init -)"
source $(pyenv root)/completions/pyenv.zsh

. $NVM_DIR/nvm.sh
. $NVM_DIR/bash_completion

. $HOME/.cargo/env

eval "$(register-python-argcomplete pipx)"
