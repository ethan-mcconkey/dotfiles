#!/bin/zsh

HISTSIZE=1000
SAVEHIST=10000
HISTFILE="$XDG_CACHE_HOME/zsh_history"

path=($HOME/.local/bin/ $HOME/bin $PYENV_ROOT/bin $path)
fpath=($DOTFILES_HOME/zsh/completions $fpath)
cdpath=($HOME/Documents/code)

autoload -Uz compinit
compinit
autoload -U bashcompinit
bashcompinit

setopt histignorealldups 
setopt sharehistory
setopt autocd
setopt auto_cd

if [[ -f $DOTFILES_HOME/zsh/plugins.zsh ]]; then
  source $DOTFILES_HOME/zsh/plugins.zsh
fi

if [[ -f $DOTFILES_HOME/zsh/apps.zsh ]]; then
  source $DOTFILES_HOME/zsh/apps.zsh
fi

if [[ -f $DOTFILES_HOME/zsh/completions.zsh ]]; then
  source $DOTFILES_HOME/zsh/completions.zsh
fi

if [[ -f $DOTFILES_HOME/zsh/aliases.zsh ]]; then
  source $DOTFILES_HOME/zsh/aliases.zsh
fi

zstyle ':autocomplete:*' delay 0.1

eval "$(starship init zsh)"
