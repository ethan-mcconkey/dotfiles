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
export ZSH_PLUGINS="$XDG_CONFIG_HOME/zsh/plugins"
export ZSH_COMPLETIONS="$XDG_CONFIG_HOME/zsh/completions"

[[ -f $ZSH_PLUGINS/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]] && ZSH_AUTOSUGGEST_STRATEGY=(history completion)

. "$HOME/.cargo/env"
