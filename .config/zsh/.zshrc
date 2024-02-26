#!/bin/zsh

HISTSIZE=10000
SAVEHIST=100000
HISTFILE="$XDG_STATE_HOME/zsh/history"

setopt histignorealldups 
setopt sharehistory
setopt autocd
setopt auto_cd

autoload -U colors && colors

[[ -f $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ -f $ZDOTDIR/plugins/catppuccin-zsh-syntax-highlighting/themes/catppuccin_frappe-zsh-syntax-highlighting.zsh ]] && source $ZDOTDIR/plugins/catppuccin-zsh-syntax-highlighting/themes/catppuccin_frappe-zsh-syntax-highlighting.zsh

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

[[ -f ~/.dotfiles/.config/zsh/vimode.zsh ]] && source ~/.dotfiles/.config/zsh/vimode.zsh

eval "$(starship init zsh)"
