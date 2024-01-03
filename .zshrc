HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

if [[ -f ~/.zsh_aliases.sh ]]; then
  source ~/.zsh_aliases.sh
fi

if [[ -f ~/.zsh_functions.sh ]]; then
  source ~/.zsh_functions.sh
fi

if [[ ! -a ~/.zfunc/_rustup ]]; then
  rustup completions zsh > ~/.zfunc/_rustup
fi

if [[ ! -a ~/.zfunc/_cargo ]]; then
  rustup completions zsh cargo > ~/.zfunc/_cargo  
fi

fpath+=~/.zfunc

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

export GPG_TTY=$(tty)
export PATH="$HOME/.local/bin:$PATH"

setopt autocd
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
zstyle ':completion:*' list-suffixeszstyle ':completion:*' expand prefix suffix
autoload bashcompinit && bashcompinit

eval "$(starship init zsh)"
