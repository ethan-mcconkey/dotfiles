#!/bin/zsh

HISTSIZE=1000
SAVEHIST=10000
HISTFILE="$XDG_STATE_HOME/zsh/history"

setopt histignorealldups 
setopt sharehistory
setopt autocd
setopt auto_cd

autoload -U colors && colors

[[ -f $ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source $ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ -f $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ -f $ZSH_PLUGINS/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]] && source $ZSH_PLUGINS/zsh-autocomplete/zsh-autocomplete.plugin.zsh

zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache
zstyle ':autocomplete:*' delay 0.25
zstyle ':autocomplete:*' add-space executables aliases functions builtins reserved-words commands
zstyle ':autocomplete:*' recent-dirs zoxide

[[ -f $DOTFILES_HOME/zsh/apps.zsh ]] && source $DOTFILES_HOME/zsh/apps.zsh

[[ -f $DOTFILES_HOME/zsh/completions.zsh ]] && source $DOTFILES_HOME/zsh/completions.zsh

[[ -f $DOTFILES_HOME/zsh/aliases.zsh ]] && source $DOTFILES_HOME/zsh/aliases.zsh

bindkey -v

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
