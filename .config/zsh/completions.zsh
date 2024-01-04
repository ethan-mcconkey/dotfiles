#!/bin/zsh

ZSH_COMPLETIONS="$HOME/.config/zsh/completions"

if [[ -d $ZSH_COMPLETIONS ]]; then
  if [[ ! -f $ZSH_COMPLETIONS/_rustup ]]; then
    rustup completions zsh > $ZSH_COMPLETIONS/_rustup
  fi

  if [[ ! -f $ZSH_COMPLETIONS/_cargo ]]; then
    rustup completions zsh cargo > $ZSH_COMPLETIONS/_cargo
  fi

  if [[ ! -f $ZSH_COMPLETIONS/_poetry ]]; then
    poetry completions zsh > $ZSH_COMPLETIONS/_poetry
  fi
fi

#pipx
eval "$(register-python-argcomplete pipx)"

#pyenv
source $(pyenv root)/completions/pyenv.zsh
