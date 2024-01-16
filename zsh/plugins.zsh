#!/bin/zsh

ZSH_PLUGINS_DIR="$DOTFILES_HOME/zsh/plugins"

if [ -d $ZSH_PLUGINS_DIR/zsh-autosuggestions ]; then
  source $ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)
fi

if [ -d $ZSH_PLUGINS_DIR/zsh-syntax-highlighting ]; then
  source $ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [[ -d $ZSH_PLUGINS_DIR/zsh-autocomplete ]]; then
  source $ZSH_PLUGINS_DIR/zsh-autocomplete/zsh-autocomplete.plugin.zsh
fi
