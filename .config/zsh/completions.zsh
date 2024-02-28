#!/bin/zsh

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

[[ ! -f $XDG_DATA_HOME/zsh/completions/_rg ]] && \
  rg --generate complete-zsh > $XDG_DATA_HOME/zsh/completions/_rg

[[ ! -f $XDG_DATA_HOME/zsh/completions/_tmuxinator ]] && \
  wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -O \
  $XDG_DATA_HOME/zsh/completions/_tmuxinator

eval "$(register-python-argcomplete pipx)"

eval "$(pip completion --zsh)"
