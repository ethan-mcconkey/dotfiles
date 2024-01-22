#!/bin/sh

DOTFILES_DIR=$(pwd)

create_symlink() {
  local src=$1
  local dest=$2
  local dest_dir=$(dirname $dest)

  if [ ! -d $dest_dir ]; then
    mkdir -p $dest_dir
  fi

  ln -sf $src $dest
}

create_symlink $DOTFILES_DIR/zsh/zshrc.zsh $HOME/.zshrc
create_symlink $DOTFILES_DIR/zsh/zshenv.zsh $HOME/.zshenv
create_symlink $DOTFILES_DIR/alacritty/alacritty.toml $HOME/.config/alacritty/alacritty.toml
create_symlink $DOTFILES_DIR/starship/starship.toml $HOME/.config/starship/starship.toml
create_symlink $DOTFILES_DIR/nvim $HOME/.config/nvim/lua/custom
create_symlink $DOTFILES_DIR/tmux/tmux.conf $HOME/.config/tmux/tmux.conf
create_symlink $DOTFILES_DIR/poetry/poetry.toml $HOME/.config/poetry/poetry.toml
