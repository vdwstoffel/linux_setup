#!/usr/bin/bash

current_user=$(whoami)
working_directory=$(pwd)

# Install zsh
if command -v zsh &> /dev/null;
then
    echo "zsh already installed"
    echo $(zsh --version)
else
    echo "Installing zsh..."
    sudo apt install zsh
fi

# install oh my zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# make zsh the default shell
chsh -s $(which zsh)

# create symbolic links for the dotfiles
ln -s $working_directory/.zshrc /home/$current_user/.zshrc
ln -s $working_directory/.gitconfig /home/$current_user/.gitconfig
