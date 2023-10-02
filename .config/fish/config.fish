if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_autosuggestion_enabled 0
    # pyenv
    set -Ux PYENV_ROOT $HOME/.pyenv
    fish_add_path $PYENV_ROOT/bin
    # GO
    set --export GOPATH $HOME/go
    fish_add_path $GOPATH/bin
    # GHQ
    set --export GHQ_ROOT $HOME/Developer
    alias repo ghq
    # ZK
    set -gx ZK_NOTEBOOK_DIR $GHQ_ROOT/github.com/112358fn/notes
    # code
    bind \co "code (repo list -p | fzf )"
    
    # OS specific
    switch (uname)
        case Darwin
            alias pinentry pinentry-mac
            alias timeout gtimeout
            fish_add_path $HOME/.local/bin /opt/homebrew/bin
    end
end

# Theme
starship init fish | source

#GPG SSH Agent
set -gx GPG_TTY (tty)
set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye > /dev/null

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
#     eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
# end
# <<< conda initialize <<<

