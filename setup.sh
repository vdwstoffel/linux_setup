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
echo "Installing oh my zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ];
then
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "oh my zsh already installed"
fi

# install plugins
echo "Installing plugins..."
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ];
then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
    echo "zsh-autosuggestions already installed"
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ];
then 
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
 echo "zsh-syntax-highlighting already installed"
fi

# make zsh the default shell
echo "Making zsh the default shell..."
chsh -s $(which zsh)


# create symbolic links for the dotfiles
echo "Creating symbolic links..."
ln -sf $working_directory/.zshrc /home/$current_user/.zshrc
ln -sf $working_directory/.gitconfig /home/$current_user/.gitconfig
ln -sf $working_directory/.vimrc /home/$current_user/.vimrc
