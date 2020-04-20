#!/bin/bash
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

# brew install neovim \
#             zsh \
#             tmux \
#             wget \
#             nvm

# Install zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt-get install zsh

# change vim to nvim
ln -s /usr/local/bin/nvim /usr/local/bin/vim

# Load neovim configurations
ln -s ~/dotfiles/.vim/init.vim ~/.config/nvim/init.vim

# Create symlink to zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc

# Create symlink to tmux config
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

# change zsh to default shell
chsh -s $(which zsh)
