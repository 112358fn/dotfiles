#!/usr/bin/bash

# Install golang
# sudo apt install wget
# wget https://go.dev/dl/go1.19.4.linux-amd64.tar.gz
# sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.19.4.linux-amd64.tar.gz
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

# Install rustlang
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


# Install GHQ
go install github.com/x-motemen/ghq@latest


# DOT Files
export GHQ_ROOT="$HOME/Developer" 
ghq get git@github.com:112358fn/dotfiles.git
DOT_FILES=$GHQ_ROOT/github.com/112358fn/dotfiles

# GIT config
ln -nsf $DOT_FILES/gitconfig $HOME/.gitconfig
ln -nsf $DOT_FILES/gitignore $HOME/.gitignore

# ZSH
sudo apt update && sudo apt install zsh autojump
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -nsf $DOT_FILES/.zshenv $HOME/.zshenv
mkdir .config/zsh
ln -nsf $DOT_FILES/.config/zsh/.zshrc $HOME/.config/zsh/.zshrc
mv $HOME/.oh-my-zsh $HOME/.config/zsh/oh-my-zsh
rm $HOME/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.config/zsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# TMUX
sudo apt update && sudo apt install tmux
mkdir -p $HOME/.config/tmux/plugins
git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm
ln -nsf $DOT_FILES/.config/tmux/tmux.conf $HOME/.config/tmux/tmux.conf

# NVIM
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p $HOME/.config/nvim
ln -nsf $DOT_FILES/.config/nvim/init.vim $HOME/.config/nvim/init.vim