#!/bin/zsh

if [[ -f ~/builds/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]]; then
  source ~/builds/zsh-autocomplete/zsh-autocomplete.plugin.zsh
fi

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [[ -f /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]]; then
  source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
  if ! fast-theme -s | rg -q catppuccin-frappe; then
    fast-theme XDG:catppuccin-frappe
  fi
fi
