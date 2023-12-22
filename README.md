# My dotfiles
A repository with all my linux dotfiles

# Dependencies
## Linux
**starship**

```bash
curl -sS https://starship.rs/install.sh | sh
```

**pyenv**
```bash
curl https://pyenv.run | bash
```

**nvm**
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
```

### Ubuntu/Debian
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
sudo nala install bash-completion trash-cli yadm bat openssh-server openssh-client
```

Optional dependecies
```bash
sudo nala update
sudo nala install timeshift
```
