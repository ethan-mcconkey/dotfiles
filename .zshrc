export VAGRANT_DEFAULT_PROVIDER="hyperv"
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
export EDITOR=code
export KUBE_EDITOR=code
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_ZA.UTF-8

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/functions.zsh ]] && source ~/.zsh/functions.zsh
[[ -f ~/.zsh/wsl2fix.zsh ]] && source ~/.zsh/wsl2fix.zsh

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HISTFILE=~/.zsh_history
HIST_STAMPS="dd.mm.yyyy"
HISTSIZE=1000
SAVEHIST=1000
ZSH_CUSTOM=~/.zsh/

plugins=(
    git
    aliases
    alias-finder
    nvm
    npm
    pip
    poetry
    pyenv
    python
)

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
zstyle ':omz:plugins:nvm' lazy yes
zstyle ':omz:plugins:nvm' lazy-cmd eslint prettier typescript
zstyle ':omz:plugins:alias-finder' autoload yes

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

source $ZSH/oh-my-zsh.sh
