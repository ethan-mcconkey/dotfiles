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
sudo ln -s $HOME/.dotfiles/zshenv.zsh /etc/zsh/zshenv
```
