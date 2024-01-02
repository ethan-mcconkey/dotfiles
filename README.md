# My dotfiles
A repository with all my linux dotfiles

# Dependencies
## pipx
```
pipx install poetry
pipx install poethepoet
```
## [Rust](https://www.rust-lang.org/)
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## starship
```bash
curl -sS https://starship.rs/install.sh | sh
```

## [pyenv](https://github.com/pyenv/pyenv)
```bash
sudo nala update
sudo nala install build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
curl https://pyenv.run | bash
pyenv install 3.11.7
pyenv global 3.11.7
```

## nvm
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
nvm install --lts
nvm use --lts
```

## lazygit
```bash
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```

## neovim
```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
```

## lunarvim
```bash
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
```

## Ubuntu/Debian
**Nala**
```bash
sudo apt update
sudo apt install nala
```

Configure nala
```bash
sudo nala fetch
```

When asked to select servers type the following `1 2 3` then type `y` to confirm your choices.
Then use nala to upgrade the system.
```bash
sudo nala clean
sudo nala upgrade -y
sudo nala autopurge -y
sudo nala autoremove -y
sudo nala clean
```

Then use nala to install the dependecies
```bash
sudo nala update
sudo nala install bash-completion trash-cli yadm bat openssh-server openssh-client curl exa pipx tmux timeshift fzf tldr
```

# Colours

black = '#000000'
pink = '#E06C75'
green = '#98C379'
orange = '#D19A66'
blue = '#61AFEF'
purple = '#C678DD'
cyan = '#56B6C2'
light_grey = '#ABB2BF'
dark_gray = '#5C6370'
white = '#FFFFFF'
