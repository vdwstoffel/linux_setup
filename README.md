# My Linux Setup
Configurations for my personal Ubuntu Linux setup

## Clone Repo

```bash
# Clone repo using http
git clone https://github.com/vdwstoffel/linux_setup.git

# Clone repo using ssh
git clone git@github.com:vdwstoffel/linux_setup.git
```

# Automatic Installation

Run the setup script

```bash
./setup.sh
```

# Manual Installation

## Install zsh

```bash
sudo apt install zsh
```

Ensure zsh is installed by running

```
zsh --version
```

Make zsh your default shell

```bash
chsh -s $(which zsh)
```

## Install oh My Zsh!

```bash
wget sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Add oh my zsh plugins

### zsh-autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### zsh-syntax-highlighting

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Create a symlink between dot files
By creating a symlink the two files will be kept in sync. Once one file changes the other will reflect those changes

`pwd` - Your current working location

`whoami` - your username

```bash
ln -s $(pwd)/.zshrc /home/$(whoami)/.zshrc
ln -s $(pwd)/.gitconfig /home/$(whoami)/.gitconfig
ln -s $(pwd)/.vimrc /home/$(whoami)/.vimrc
```