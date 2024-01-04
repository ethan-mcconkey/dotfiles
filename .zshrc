#!/bin/zsh

# COMPLETIONS 
autoload -Uz compinit
compinit

autoload -U bashcompinit
bashcompinit

# ZSH 
ZSH_CONFIG="$HOME/.config/zsh"

if [[ -d $ZSH_CONFIG ]]; then
  if [[ -f $ZSH_CONFIG/exports.zsh ]]; then
    source $ZSH_CONFIG/exports.zsh
  fi

  if [[ -f $ZSH_CONFIG/aliases.zsh ]]; then
    source $ZSH_CONFIG/aliases.zsh ]]
  fi

  if [[ -f $ZSH_CONFIG/functions.zsh ]]; then
    source $ZSH_CONFIG/functions.zsh
  fi

  if [[ -f $ZSH_CONFIG/options.zsh ]]; then
    source $ZSH_CONFIG/options.zsh
  fi

  if [[ -f $ZSH_CONFIG/completions.zsh ]]; then
    source $ZSH_CONFIG/completions.zsh
  fi

  if [[ -f $ZSH_CONFIG/init.zsh ]]; then
    source $ZSH_CONFIG/init.zsh
  fi
fi

# HISTORY 
HISTSIZE=1000 # 1000 lines of history loaded into memory
SAVEHIST=10000 # 10000 lines of history saved to disk
HISTFILE="$XDG_CACHE_HOME/zsh_history"

# PLUGINS 
ZSH_PLUGINS="$ZSH_CONFIG/plugins"

if [[ -d $ZSH_PLUGINS/zsh-autosuggestions ]]; then
  source $ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)
else
  git clone git@github.com:zsh-users/zsh-completions.git $ZSH_PLUGINS/zsh-autosuggestions
  source $ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)
fi

if [[ -d $ZSH_PLUGINS/zsh-syntax-highlighting ]]; then
  source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  git clone git@github.com:zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGINS/zsh-syntax-highlighting
  source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [[ -d $ZSH_PLUGINS/zsh-completions ]]; then
  export FPATH="$ZSH_PLUGINS/zsh-completions/src:$FPATH"
else
  git clone git@github.com:zsh-users/zsh-completions.git $ZSH_PLUGINS/zsh-completions
  export FPATH="$ZSH_PLUGINS/zsh-completions/src:$FPATH"
fi

eval "$(starship init zsh)"
