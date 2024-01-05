#!/bin/zsh

ZSH_PLUGINS="$ZSH_CONFIG/plugins"

# AUTOSUGGESTIONS 
if [[ -d $ZSH_PLUGINS/zsh-autosuggestions ]]; then
  source $ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)
else
  git clone  git@github.com:zsh-users/zsh-autosuggestions.git $ZSH_PLUGINS/zsh-autosuggestions
  source $ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)
fi

# SYNTAX HIGHLIGHTING 
if [[ -d $ZSH_PLUGINS/zsh-syntax-highlighting ]]; then
  source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  git clone git@github.com:zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGINS/zsh-syntax-highlighting
  source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# COMPLETIONS 
if [[ -d $ZSH_PLUGINS/zsh-completions ]]; then
  export FPATH="$ZSH_PLUGINS/zsh-completions/src:$FPATH"
else
  git clone git@github.com:zsh-users/zsh-completions.git $ZSH_PLUGINS/zsh-completions
  export FPATH="$ZSH_PLUGINS/zsh-completions/src:$FPATH"
fi
