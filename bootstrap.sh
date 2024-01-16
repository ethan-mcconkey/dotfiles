#!/bin/sh

DOTFILES_DIR=$(pwd)

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

create_symlink() {
  local src=$1
  local dest=$2
  local dest_dir=$(dirname $dest)

  if [ ! -d $dest_dir ]; then
    mkdir -p $dest_dir
    info "Created a directory at \"$dest_dir\"."
  fi

  if [ -f $dest ]; then
    if [ -L $dest ]; then
      rm $dest > /dev/null 2> info
      ln -s $src $dest > /dev/null 2> info
      success "Successfully symlinked \"$src\" to \"$dest\"."
    else 
      mv $dest "$dest.backup" > /dev/null 2> info
      ln -s $src $dest > /dev/null 2> info
      success "Successfully symlinked \"$src\" to \"$dest\"."
    fi
  else
    ln -s $src $dest > /dev/null 2> info
    success "Successfully symlinked \"$src\" to \"$dest\"."
  fi
}

create_symlink $DOTFILES_DIR/zsh/zshrc.zsh $HOME/.zshrc
create_symlink $DOTFILES_DIR/zsh/zshenv.zsh $HOME/.zshenv
create_symlink $DOTFILES_DIR/starship/starship.toml $HOME/.config/starship/starship.toml
create_symlink $DOTFILES_DIR/alacritty/alacritty.toml $HOME/.config/alacritty/alacritty.toml
create_symlink $DOTFILES_DIR/tmux/tmux.conf $HOME/.config/tmux/tmux.conf
create_symlink $DOTFILES_DIR/lvim/config.lua $HOME/.config/lvim/config.lua
create_symlink $DOTFILES_DIR/lvim/lua/user/plugins.lua $HOME/.config/lvim/lua/user/plugins.lua
create_symlink $DOTFILES_DIR/lvim/lua/user/keymaps.lua $HOME/.config/lvim/lua/user/keymaps.lua
create_symlink $DOTFILES_DIR/lvim/lua/user/options.lua $HOME/.config/lvim/lua/user/options.lua

create_symlink $DOTFILES_DIR/optional/pypoetry/config.toml $HOME/.config/pypoetry/config.toml
