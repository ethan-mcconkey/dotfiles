#!/bin/zsh

HISTSIZE=1000
SAVEHIST=10000
HISTFILE="$XDG_STATE_HOME/zsh/history"

setopt histignorealldups 
setopt sharehistory
setopt autocd
setopt auto_cd

autoload -U colors && colors

[[ -f $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ -f $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ -f $ZDOTDIR/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]] && source $ZDOTDIR/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache
zstyle ':autocomplete:*' delay 0.25
zstyle ':autocomplete:*' add-space executables aliases functions builtins reserved-words commands
zstyle ':autocomplete:*' recent-dirs zoxide
zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
zstyle ':autocomplete:*history*:*' insert-unambiguous yes
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes
zstyle ':completion:*:*' matcher-list 'm:{[:lower:]-}={[:upper:]_}' '+r:|[.]=**'

[[ -f $ZDOTDIR/apps.zsh ]] && source $ZDOTDIR/apps.zsh

[[ -f $ZDOTDIR/completions.zsh ]] && source $ZDOTDIR/completions.zsh

[[ -f $ZDOTDIR/aliases.zsh ]] && source $ZDOTDIR/aliases.zsh

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

eval "$(starship init zsh)"
