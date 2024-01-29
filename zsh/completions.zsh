#!/bin/zsh

[[ ! -d $ZSH_COMPLETIONS ]] && mkdir -p $ZSH_COMPLETIONS

(( $+commands[rustup] )) && [[ ! -f $ZSH_COMPLETIONS/_rustup ]] && rustup completions zsh > $ZSH_COMPLETIONS/_rustup

(( $+commands[cargo] )) && [[ ! -f $ZSH_COMPLETIONS/_cargo ]] && rustup completions zsh cargo > $ZSH_COMPLETIONS/_cargo

(( $+commands[poetry] )) && [[ ! -f $ZSH_COMPLETIONS/_poetry ]] && poetry completions zsh > $ZSH_COMPLETIONS/_poetry

(( $+commands[poe] )) && [[ ! -f $ZSH_COMPLETIONS/_poe ]] && poe _zsh_completion > $ZSH_COMPLETIONS/_poe

[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion

[[ -f $PYENV_ROOT/completions/pyenv.zsh ]] && source $(pyenv root)/completions/pyenv.zsh

(( $+commands[rg] )) && [[ ! -f $ZSH_COMPLETIONS/_rg ]] && rg --generate complete-zsh > $ZSH_COMPLETIONS/_rg

(( $+commands[tmuxinator] )) && [[ ! -f $ZSH_COMPLETIONS/_tmuxinator ]] && wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -O $ZSH_COMPLETIONS/_tmuxinator
