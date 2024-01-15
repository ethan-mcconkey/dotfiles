#!/bin/zsh

ZSH_COMPLETIONS_DIR="$DOTFILES_HOME/zsh/completions"

if [[ ! -f $ZSH_COMPLETIONS_DIR/_rustup ]]; then
  rustup completions zsh > $ZSH_COMPLETIONS_DIR/_rustup
fi

if [[ ! -f $ZSH_COMPLETIONS_DIR/_cargo ]]; then
  rustup completions zsh cargo > $ZSH_COMPLETIONS_DIR/_cargo
fi

if [[ ! -f $ZSH_COMPLETIONS_DIR/_poetry ]]; then
  poetry completions zsh > $ZSH_COMPLETIONS_DIR/_poetry
fi

if [[ ! -f $ZSH_COMPLETIONS_DIR/_poe ]]; then
  poe _zsh_completion > $ZSH_COMPLETIONS_DIR/_poe
fi

[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion

source $(pyenv root)/completions/pyenv.zsh
