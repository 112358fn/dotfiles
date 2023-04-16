# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

#PYENV
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

case `uname` in
  Darwin)
    # commands for OS X go here
    # Pinentry
    alias pinentry='pinentry-mac'
    alias timeout='gtimeout'
    export PATH=$PATH:$HOME/.local/bin
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
