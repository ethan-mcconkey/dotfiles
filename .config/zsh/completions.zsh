#!/bin/zsh

[[ ! -d $ZDOTDIR/completions ]] && mkdir -p $ZDOTDIR/completions

(( $+commands[rustup] )) && [[ ! -f $ZDOTDIR/completions/_rustup ]] && rustup completions zsh > $ZDOTDIR/completions/_rustup

(( $+commands[cargo] )) && [[ ! -f $ZDOTDIR/completions/_cargo ]] && rustup completions zsh cargo > $ZDOTDIR/completions/_cargo

(( $+commands[poetry] )) && [[ ! -f $ZDOTDIR/completions/_poetry ]] && poetry completions zsh > $ZDOTDIR/completions/_poetry

(( $+commands[poe] )) && [[ ! -f $ZDOTDIR/completions/_poe ]] && poe _zsh_completion > $ZDOTDIR/completions/_poe

[[ -f $PYENV_ROOT/completions/pyenv.zsh ]] && source $(pyenv root)/completions/pyenv.zsh

(( $+commands[rg] )) && [[ ! -f $ZDOTDIR/completions/_rg ]] && rg --generate complete-zsh > $ZDOTDIR/completions/_rg

(( $+commands[tmuxinator] )) && [[ ! -f $ZDOTDIR/completions/_tmuxinator ]] && wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -O $ZDOTDIR/completions/_tmuxinator

(( $+commands[pipx] )) && eval "$(register-python-argcomplete pipx)"
