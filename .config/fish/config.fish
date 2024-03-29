if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_autosuggestion_enabled 0
    ## pyenv
    #set -Ux PYENV_ROOT $HOME/.pyenv
    #fish_add_path $PYENV_ROOT/bin
    # GO
    set --export GOPATH $HOME/go
    fish_add_path $GOPATH/bin
    # GHQ
    set --export GHQ_ROOT $HOME/Developer
    # alias repo ghq
    # ZK
    set -gx ZK_NOTEBOOK_DIR $HOME/Nextcloud/Notes
    # code
    #bind \co "code (repo list -p | fzf )"
    
    # OS specific
    switch (uname)
        case Darwin
            alias pinentry pinentry-mac
            alias timeout gtimeout
            fish_add_path $HOME/.local/bin /opt/homebrew/bin
            fish_add_path /usr/local/bin
            fish_add_path $HOME/.cargo/bin
            tkn completion fish | source
        case Linux
            direnv hook fish | source
    end
    #GPG SSH Agent
    set -gx GPG_TTY (tty)
    set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent
    gpg-connect-agent updatestartuptty /bye > /dev/null
end

# Theme
starship init fish | source


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
    eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

#launchctl unload /Library/LaunchAgents/net.volvocars.DisplayLinkUserAgent.plist
