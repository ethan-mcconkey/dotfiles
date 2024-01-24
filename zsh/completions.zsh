#!/bin/zsh

[[ ! -d $ZSH_COMPLETIONS ]] && mkdir -p $ZSH_COMPLETIONS

[[ ! -f $ZSH_COMPLETIONS/_rustup ]] && rustup completions zsh > $ZSH_COMPLETIONS/_rustup

[[ ! -f $ZSH_COMPLETIONS/_cargo ]] && rustup completions zsh cargo > $ZSH_COMPLETIONS/_cargo

[[ ! -f $ZSH_COMPLETIONS/_poetry ]] && poetry completions zsh > $ZSH_COMPLETIONS/_poetry

[[ ! -f $ZSH_COMPLETIONS/_poe ]] && poe _zsh_completion > $ZSH_COMPLETIONS/_poe

[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion

[[ -f $PYENV_ROOT/completions/pyenv.zsh ]] && source $(pyenv root)/completions/pyenv.zsh
