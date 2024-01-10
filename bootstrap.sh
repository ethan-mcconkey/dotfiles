#!/bin/sh

DOTFILES_DIR=$(pwd)

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

create_symlink() {
  local src=$1
  local dest=$2
  
  if [ ! -f $src ]; then
    echo "Cannot find \"$src\"."
    return
  fi

  if [ -L $dest ]; then
    rm $dest
    ln -s $src $dest
  elif [ -f $dest ] ; then
    mv $dest "$dest.backup"
    ln -s $src $dest
  else
    ln -s $src $dest
  fi
  success "$(basename $dest): Successfully created a symlink."
}

echo "\n---------- CREATING SYMLINKS ----------"
create_symlink $DOTFILES_DIR/zsh/zshrc.zsh $HOME/.zshrc
create_symlink $DOTFILES_DIR/starship/starship.toml $HOME/.config/starship/starship.toml
create_symlink $DOTFILES_DIR/lvim/config.lua $HOME/.config/lvim/config.lua
create_symlink $DOTFILES_DIR/alacritty/alacritty.toml $HOME/.config/alacritty/alacritty.toml
