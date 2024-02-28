#!/bin/zsh

export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export FPATH="$HOME/.config/zsh/completions:$FPATH"
export CDPATH="$HOME/Documents/code:$CDPATH"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg:$XDG_CONFIG_DIRS"

export GPG_TTY=$(tty)
export TERM="xterm-256color"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export KEYTIMEOUT=1
export EDITOR=nvim
export PYENV_ROOT="$HOME/.pyenv"

. $HOME/.cargo/env
