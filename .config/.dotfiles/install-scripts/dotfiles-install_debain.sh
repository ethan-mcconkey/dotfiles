#!/bin/sh

echo "---------- INSTALLING NALA ----------"
sudo apt update -y && sudo apt install nala -y

echo "\n---------- SETTING UP NALA SERVERS ----------"
echo "1 2 3" | sudo nala fetch -y

echo "\n---------- INSTALLING DEPENDENCIES USING NALA ----------"
NALA_DEPS=(trash-cli yadm bat openssh-server openssh-client exa tmux timeshift fzf tldr git make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev qemu-kvm qemu-system qemu-utils python3 python3-pip libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager)
sudo nala update
for dep in $NALA_DEPS; do
  sudo nala install $dep
done

echo "\n---------- INSTALLING OTHER PROGRAMS AND DEPENDENCIES ----------"
echo "---------- INSTALLING PIPX AND PIPX PROGRAMS ----------"
sudo nala install pipx
pipx ensurepath

pipx install poetry
pipx install poethepoet

echo "---------- INSTALLING PYENV AND PYTHON VERSIONS ----------"
curl https://pyenv.run | zsh

pyenv install 3.11.7
pyenv global 3.11.7
pyenv install 3.12.0

echo "---------- INSTALLING RUSTUP, RUST, AND CARGO ----------"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "---------- INSTALLING STARSHIP ----------"
curl -sS https://starship.rs/install.sh | sh

echo "---------- INSTALLING NVM AND NODE ----------"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | zsh

nvm install node
nvm use node

echo "---------- INSTALLING LAZYGIT ----------"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit.tar.gz

echo "---------- INSTALLING NEOVIM ----------"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

echo "---------- INSTALLING LUNARVIM ----------"
LV_BRANCH='release-1.3/neovim-0.9' zsh <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)

echo "\n ---------- CONFIGURING QEMU AND VIRT-MANAGER ----------"
sudo virsh net-start default
sudo virsh net-autostart default

sudo usermod -aG libvirt $USER
sudo usermod -aG libvirt-qemu $USER
sudo usermod -aG kvm $USER
sudo usermod -aG input $USER
sudo usermod -aG disk $USER
