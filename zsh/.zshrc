export DOTFILES_HOME="$HOME/repos/dotfiles"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg:$XDG_CONFIG_DIRS"

export PATH="$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export FPATH="$XDG_DATA_HOME/zsh/completions:$FPATH"

export KEYTIMEOUT=1
export EDITOR=nvim

# ZINIT Setup
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light MichaelAquilina/zsh-you-should-use
zinit light Aloxaf/fzf-tab

# Snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Apps
eval "$(ssh-agent -s)" > /dev/null && ssh-add

export BAT_THEME="Catppuccin-mocha"

export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
[[ -d $PYENV_ROOT/shims ]] && export PATH="$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none
  --color=bg+:#283457 \
  --color=bg:#16161e \
  --color=border:#27a1b9 \
  --color=fg:#c0caf5 \
  --color=gutter:#16161e \
  --color=header:#ff9e64 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#27a1b9 \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"
eval "$(fzf --zsh)"

eval "$(zoxide init --cmd cd zsh)"

eval "$(thefuck --alias)"

export PNPM_HOME="/home/ethan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Completion
autoload -Uz compinit && compinit

zinit cdreplay -q

# Custom completions
[[ ! -d $XDG_DATA_HOME/zsh/completions ]] && mkdir -p $XDG_DATA_HOME/zsh/completions

[[ ! -f $XDG_DATA_HOME/zsh/completions/_rustup ]] && \
  rustup completions zsh > $XDG_DATA_HOME/zsh/completions/_rustup

[[ ! -f $XDG_DATA_HOME/zsh/completions/_cargo ]] && \
  rustup completions zsh cargo > $XDG_DATA_HOME/zsh/completions/_cargo

[[ ! -f $XDG_DATA_HOME/zsh/completions/_poetry ]] && \
  poetry completions zsh > $XDG_DATA_HOME/zsh/completions/_poetry

[[ ! -f $XDG_DATA_HOME/zsh/completions/_poe ]] && \
  poe _zsh_completion > $XDG_DATA_HOME/zsh/completions/_poe

[[ -f $PYENV_ROOT/completions/pyenv.zsh ]] && source $(pyenv root)/completions/pyenv.zsh

[[ ! -f $XDG_DATA_HOME/zsh/completions/_tmuxinator ]] && \
  wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -O \
  $XDG_DATA_HOME/zsh/completions/_tmuxinator

eval "$(register-python-argcomplete pipx)"

eval "$(pip completion --zsh)"

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Load oh-my-posh
eval "$(oh-my-posh init zsh --config /home/ethan/.config/omp/config.toml)"

# Keybinds
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=10000
HISTFILE="$XDG_STATE_HOME/.zsh-history"
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Options
setopt autocd

_fix_cursor() {
   echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)

# Aliases
alias vim='nvim'
alias cat='bat'
alias cp='cp -i'
alias mv='mv -i'
alias rmt='rmtrash -v'
alias mkdir='mkdir -p'
alias fix='fuck'
alias cd-='cd -'
alias rg='rg --color=always'
alias grep='rg'
alias ls='eza -a -F=always --icons=always --group-directories-first --sort=name -1'
alias la='ls -l -h --no-time --no-user'
alias lt='ls -T -I=".git"'
alias mux='tmuxinator'

# Functions
function mkcd() {
  if [[ -d $1 ]]; then
    cd $1
  else
    mkdir -p $1
    cd $1
  fi
}

# Display fastfetch

fastfetch
