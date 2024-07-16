#!/bin/bash

packages=(
    "stow"
    "ttf-jetbrains-mono-nerd"
    "neovim"
    "zsh"
    "fzf"
    "tldr"
    "fd"
    "ripgrep"
    "bat"
    "fastfetch"
    "pre-commit"
)

for package in ${packages[@]}; do
    yay -S --noconfirm --needed $package
done
