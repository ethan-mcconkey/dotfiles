#!/bin/bash

#Load Aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

#Load Functions
if [ -f ~/.bash_functions ]; then
	. ~/.bash_functions
fi

#Load completion
if [ -f /etc/profile.d/bash_completion.sh ]; then
	source /etc/profile.d/bash_completion.sh
fi

shopt -s checkwinsize
shopt -s histappend
shopt -s autocd

iatest=$(expr index "$-" i)
if [[ $iatest -gt 0 ]]; then bind "set bell-style visible"; fi
if [[ $iatest -gt 0 ]]; then bind "set completion-ignore-case on"; fi
if [[ $iatest -gt 0 ]]; then bind "set show-all-if-ambiguous On"; fi

export HISTFILESIZE=10000
export HISTSIZE=500
export HISTCONTROL=erasedups:ignoredups:ignorespace

eval "$(starship init bash)"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
