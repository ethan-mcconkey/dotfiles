#!/bin/zsh

ZSH_COMPLETIONS="$HOME/.config/zsh/completions"

rustup_completions() {
  if [[ ! -f $ZSH_COMPLETIONS/_rustup ]]; then
    rustup completions zsh > $ZSH_COMPLETIONS/_rustup
  fi
}

cargo_completions() {
  if [[ ! -f $ZSH_COMPLETIONS/_cargo ]]; then
    rustup completions zsh cargo > $ZSH_COMPLETIONS/_cargo
  fi
}

poetry_completions() {
  if [[ ! -f $ZSH_COMPLETIONS/_poetry ]]; then
    poetry completions zsh > $ZSH_COMPLETIONS/_poetry
  fi
}

poethepoet_completions() {
  if [[ ! -f $ZSH_COMPLETIONS/_poe ]]; then
    poe _zsh_completion > $ZSH_COMPLETIONS/_poe
  fi
}

if [[ -d $ZSH_COMPLETIONS ]]; then
  rustup_completions
  cargo_completions
  poetry_completions
  poethepoet_completions
else
  mkdir -p $ZSH_COMPLETIONS
  rustup_completions
  cargo_completions
  poetry_completions
  poethepoet_completions
fi
