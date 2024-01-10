#!/bin/zsh

export DOTFILES_HOME="$HOME/.dotfiles"

# COMPLETIONS 
autoload -Uz compinit
compinit

autoload -U bashcompinit
bashcompinit

# ZSH

ZSH_CONFIG="$DOTFILES_HOME/zsh"

if [[ -d $ZSH_CONFIG ]]; then
  if [[ -f $ZSH_CONFIG/exports.zsh ]]; then
    source $ZSH_CONFIG/exports.zsh
  fi

  if [[ -f $ZSH_CONFIG/options.zsh ]]; then
    source $ZSH_CONFIG/options.zsh
  fi

  if [[ -f $ZSH_CONFIG/plugins.zsh ]]; then
    source $ZSH_CONFIG/plugins.zsh
  fi

  if [[ -f $ZSH_CONFIG/aliases.zsh ]]; then
    source $ZSH_CONFIG/aliases.zsh ]]
  fi

  if [[ -f $ZSH_CONFIG/functions.zsh ]]; then
    source $ZSH_CONFIG/functions.zsh
  fi

  if [[ -f $ZSH_CONFIG/init.zsh ]]; then
    source $ZSH_CONFIG/init.zsh
  fi

  if [[ -f $ZSH_CONFIG/completions.zsh ]]; then
    source $ZSH_CONFIG/completions.zsh
  fi
fi

# HISTORY 
HISTSIZE=1000 # 1000 lines of history loaded into memory
SAVEHIST=10000 # 10000 lines of history saved to disk
HISTFILE="$XDG_CACHE_HOME/zsh_history"

eval "$(starship init zsh)"
