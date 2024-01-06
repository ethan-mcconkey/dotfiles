#!/bin/zsh

# https://github.com/nvm-sh/nvm
echo "---------- INSTALLING NVM ----------"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | zsh

echo "---------- INSTALLING NODE ----------"
nvm install --lts
nvm use --lts
