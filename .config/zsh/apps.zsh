#!/bin/zsh

[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init --cmd cd zsh)"

eval "$($RBENV_ROOT/bin/rbenv init - zsh)"

eval "$(thefuck --alias)"
