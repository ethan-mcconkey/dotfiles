#!/bin/zsh

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg:$XDG_CONFIG_DIRS"
export GPG_TTY=$(tty)
export TERM="xterm-256color"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export DOTFILES_HOME="$XDG_CONFIG_HOME/.dotfiles"

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
