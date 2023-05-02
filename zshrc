# oh-my-zsh
export ZSH="$HOME/.config/zsh/oh-my-zsh"
ZSH_THEME=""
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# user
export LANG=en_US.UTF-8
export EDITOR='nvim'

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# GO
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# RUST
source "$HOME/.cargo/env"

# GHQ
export GHQ_ROOT="$HOME/Developer"
alias repo="ghq"

# dotfiles
export DOT_FILES=$GHQ_ROOT/github.com/112358fn/dotfiles
alias config="/usr/bin/git --git-dir=$DOT_FILES/.git --work-tree=$DOT_FILES"

# zk notebook
export ZK_NOTEBOOK_DIR=~/Developer/github.com/112358fn/notes
alias notes="zk"

case `uname` in
  Darwin)
    # commands for OS X go here
    # Pinentry
    alias pinentry='pinentry-mac'
    alias timeout='gtimeout'
    export PATH=$PATH:$HOME/.local/bin:/opt/homebrew/bin
  ;;
  Linux)
    # commands for Linux go here
    export PATH=$PATH:/usr/local/bin/nvim/bin:$HOME/zig:/usr/local/go/bin
    if [ -z $DISPLAY ] && [ "$XDG_VTNR" -eq 1 ]; then
    	exec startx
    fi
  ;;
esac

# Starship
eval "$(starship init zsh)"
# GPG SSH Agent
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye > /dev/null
