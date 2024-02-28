#!/bin/zsh

HISTSIZE=10000
SAVEHIST=100000
HISTFILE="$XDG_STATE_HOME/zsh/history"

setopt histignorealldups 
setopt sharehistory
setopt autocd
setopt auto_cd

autoload -U colors && colors

[[ -f ~/builds/zsh-plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]] && \
    source ~/builds/zsh-plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

[[ -f ~/builds/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh ]] && \
    source ~/builds/zsh-plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

[[ -f ~/builds/zsh-plugins/zsh-syntax-highlighting-catppuccin/themes/catppuccin_frappe-zsh-syntax-highlighting.zsh ]] && \
    source ~/builds/zsh-plugins/zsh-syntax-highlighting-catppuccin/themes/catppuccin_frappe-zsh-syntax-highlighting.zsh

[[ -f ~/builds/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ]] && \
    source ~/builds/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache
zstyle ':autocomplete:*' delay 0.25
zstyle ':autocomplete:*' add-space executables aliases functions builtins reserved-words commands
zstyle ':autocomplete:*' recent-dirs zoxide
zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
zstyle ':autocomplete:*history*:*' insert-unambiguous yes
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes
zstyle ':completion:*:*' matcher-list 'm:{[:lower:]-}={[:upper:]_}' '+r:|[.]=**'

[[ -f ~/.dotfiles/.config/zsh/apps.zsh ]] && source ~/.dotfiles/.config/zsh/apps.zsh

[[ -f ~/.dotfiles/.config/zsh/completions.zsh ]] && source ~/.dotfiles/.config/zsh/completions.zsh

[[ -f ~/.dotfiles/.config/zsh/aliases.zsh ]] && source ~/.dotfiles/.config/zsh/aliases.zsh

bindkey -v
bindkey '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

[[ -f ~/.dotfiles/.config/zsh/vimode.zsh ]] && source ~/.dotfiles/.config/zsh/vimode.zsh

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    exec tmux new-session -A -s default -n default
fi

eval "$(starship init zsh)"
