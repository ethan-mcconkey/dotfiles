#!/bin/zsh

if [[ ! -d $ZSH_COMPLETIONS ]]; then
  mkdir -p $ZSH_COMPLETIONS
fi

if [[ ! -f $ZSH_COMPLETIONS/_rustup ]]; then
  rustup completions zsh > $ZSH_COMPLETIONS/_rustup
fi

if [[ ! -f $ZSH_COMPLETIONS/_cargo ]]; then
  rustup completions zsh cargo > $ZSH_COMPLETIONS/_cargo
fi

if [[ ! -f $ZSH_COMPLETIONS/_poetry ]]; then
  poetry completions zsh > $ZSH_COMPLETIONS/_poetry
fi

if [[ ! -f $ZSH_COMPLETIONS/_poe ]]; then
  poe _zsh_completion > $ZSH_COMPLETIONS/_poe
fi

[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion

source $(pyenv root)/completions/pyenv.zsh
