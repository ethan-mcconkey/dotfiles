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

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME/docker-machine"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PYTHON_HISTORY="$XDG_STATE_HOME/python/history"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export RBENV_ROOT="$XDG_DATA_HOME/rbenv"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

export GPG_TTY=$(tty)
export TERM="xterm-256color"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export DOTFILES_HOME="$HOME/.dotfiles"
export ZSH_PLUGINS="$XDG_CONFIG_HOME/zsh/plugins"
export ZSH_COMPLETIONS="$XDG_CONFIG_HOME/zsh/completions"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZDOTDIR="$HOME/.config/zsh"
export KEYTIMEOUT=1
export EDITOR=nvim

. "$CARGO_HOME/env"
