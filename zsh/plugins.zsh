#!/bin/zsh

if [[ -d $ZSH_PLUGINS/zsh-autosuggestions ]]; then
  source $ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)
fi

if [[ -d $ZSH_PLUGINS/zsh-syntax-highlighting ]]; then
  source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [[ -d $ZSH_PLUGINS/zsh-autocomplete ]]; then
  source $ZSH_PLUGINS/zsh-autocomplete/zsh-autocomplete.plugin.zsh
fi
