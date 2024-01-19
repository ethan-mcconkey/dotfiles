#!/bin/zsh

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg:$XDG_CONFIG_DIRS"
export GPG_TTY=$(tty)
export TERM="xterm-256color"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export DOTFILES_HOME="$HOME/.dotfiles"
export ZSH_PLUGINS="$DOTFILES_HOME/zsh/plugins"
export ZSH_COMPLETIONS="$DOTFILES_HOME/zsh/completions"

. "$HOME/.cargo/env"
