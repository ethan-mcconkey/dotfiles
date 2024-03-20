#!/bin/zsh

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    exec tmux new-session -A -s default -n default
fi

export HISTSIZE=10000
export SAVEHIST=100000
export HISTFILE="$XDG_STATE_HOME/zsh/history"

bindkey -v
bindkey '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

setopt histignorealldups 
setopt sharehistory
setopt autocd
setopt auto_cd

autoload -U colors && colors

[[ -f $ZDOTDIR/extensions/plugins.zsh ]] && source $ZDOTDIR/extensions/plugins.zsh

zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache
zstyle ':autocomplete:*' delay 0.25
zstyle ':autocomplete:*' add-space executables aliases functions builtins reserved-words commands
zstyle ':autocomplete:*' recent-dirs zoxide
zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
zstyle ':autocomplete:*history*:*' insert-unambiguous yes
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes
zstyle ':completion:*:*' matcher-list 'm:{[:lower:]-}={[:upper:]_}' '+r:|[.]=**'

export PATH="$XDG_CONFIG_HOME/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH"
export BAT_THEME="Catppuccin-frappe"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

export PYENV_ROOT="$HOME/.pyenv"
export PYENV_VIRTUALENV_DISABLE_PROMPT=0
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init --cmd cd zsh)"
eval "$($RBENV_ROOT/bin/rbenv init - zsh)"
eval "$(thefuck --alias)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

. $HOME/.cargo/env

export PNPM_HOME="/home/ethan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

[[ -f $ZDOTDIR/extensions/completions.zsh ]] && source $ZDOTDIR/extensions/completions.zsh

[[ -f $ZDOTDIR/extensions/aliases.zsh ]] && source $ZDOTDIR/extensions/aliases.zsh

export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
eval "$(starship init zsh)"
