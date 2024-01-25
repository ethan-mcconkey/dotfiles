# My dotfiles
A repository with all my linux dotfiles

# Installation
## Install dotfiles

```bash
git clone https://github.com/ethan-mcconkey/dotfiles.git ~/.config/.dotfiles
cd ~/.config/.dotfiles
./bootstrap.sh
```

Create symlink to zshenv file
```bash
sudo ln -s $HOME/.dotfiles/zsh/zshenv.zsh /etc/zsh/zshenv
```

## Install Dependencies
### [Nala](https://gitlab.com/volian/nala)
```bash
sudo apt update
sudo apt install nala -y
echo "1 2 3" | sudo nala fetch -y
```

### [pyenv](https://github.com/pyenv/pyenv)
```bash
sudo nala install build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
curl https://pyenv.run | bash
pyenv install 3.11.7
pyenv global 3.11.7
```

### [nvm](https://github.com/nvm-sh/nvm)
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install --lts
nvm use --lts
```

### [rustup](https://rustup.rs/)
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
