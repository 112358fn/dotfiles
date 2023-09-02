# Starship
eval "$(starship init zsh)"

# user
export LANG=en_US.UTF-8
export EDITOR='hx'

# ghq
export GHQ_ROOT="$HOME/Developer"
alias repo="ghq"

# exa
alias ls="exa --header --long --icons"

# bat
alias cat="bat"

# zk
export ZK_NOTEBOOK_DIR=~/Developer/github.com/112358fn/notes
alias notes="zk"

# dotfiles
export DOT_FILES=$GHQ_ROOT/github.com/112358fn/dotfiles
alias config="/usr/bin/git --git-dir=$DOT_FILES/.git --work-tree=$DOT_FILES"

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
  ;;
esac

# GPG SSH Agent
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye > /dev/null
