PS1="\[\033[0;36m\]\u@\h: \[\033[0;91m\]\w %\[\033[0;36m\] \[\n\]$ \[\033[0m\]"
TERM=xterm-color

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
	. ~/.bash_functions
fi

if [ -f ~/.bash_completion ]; then
	. ~/.bash_completion
fi

if [ -f /etc/profile.d/bash_completion.sh ]; then
	source /etc/profile.d/bash_completion.sh
fi

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
