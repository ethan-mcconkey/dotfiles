#!/bin/zsh

export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export FPATH="$XDG_CONFIG_HOME/zsh/completions:$FPATH"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg:$XDG_CONFIG_DIRS"

export GPG_TTY=$(tty)

export TERM="xterm-256color"

export STARSHIP_CONFIG=~/.config/starship/starship.toml

export PYENV_ROOT="$HOME/.pyenv"
