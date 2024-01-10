#!/bin/zsh

# https://github.com/pyenv/pyenv
echo "---------- INSTALLING PYENV ----------"
sudo nala install build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev\
xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

curl https://pyenv.run | zsh

echo "---------- INSTALLING PYTHON VERSIONS ----------"
pyenv install 3.11.7
pyenv install 3.12.0
pyenv global 3.11.7
