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

create_symlink $DOTFILES_DIR/zsh/zshrc.zsh $HOME/.config/zsh/.zshrc
create_symlink $DOTFILES_DIR/alacritty/alacritty.toml $HOME/.config/alacritty/alacritty.toml
create_symlink $DOTFILES_DIR/starship/starship.toml $HOME/.config/starship/starship.toml
create_symlink $DOTFILES_DIR/nvim $HOME/.config/nvim/lua/custom
create_symlink $DOTFILES_DIR/tmux/tmux.conf $HOME/.config/tmux/tmux.conf
create_symlink $DOTFILES_DIR/tmuxinator $HOME/.config/tmuxinator
create_symlink $DOTFILES_DIR/pypoetry/config.toml $HOME/.config/pypoetry/config.toml
create_symlink $DOTFILES_DIR/xinit/xinitrc $HOME/.xinitrc
create_symlink $DOTFILES_DIR/awesome/rc.lua $HOME/.config/awesome/rc.lua
