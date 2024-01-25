#!/bin/zsh

HISTSIZE=1000
SAVEHIST=10000
HISTFILE="$XDG_STATE_HOME/zsh/history"

setopt histignorealldups 
setopt sharehistory
setopt autocd
setopt auto_cd

[[ -f $ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source $ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ -f $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ -f $ZSH_PLUGINS/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]] && source $ZSH_PLUGINS/zsh-autocomplete/zsh-autocomplete.plugin.zsh

zstyle ':autocomplete:*' delay 0.25
zstyle ':autocomplete:*' add-space executables aliases functions builtins reserved-words commands
zstyle ':autocomplete:*' recent-dirs zoxide

if [[ -f $DOTFILES_HOME/zsh/apps.zsh ]]; then
  source $DOTFILES_HOME/zsh/apps.zsh
fi

if [[ -f $DOTFILES_HOME/zsh/completions.zsh ]]; then
  source $DOTFILES_HOME/zsh/completions.zsh
fi

if [[ -f $DOTFILES_HOME/zsh/aliases.zsh ]]; then
  source $DOTFILES_HOME/zsh/aliases.zsh
fi

bindkey -v

eval "$(starship init zsh)"
