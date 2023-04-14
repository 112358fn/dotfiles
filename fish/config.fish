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
    # dotfiles
    set DOT_FILES $GHQ_ROOT/github.com/112358fn/dotfiles
    alias config "/usr/bin/git --git-dir=$DOT_FILES/.git --work-tree=$DOT_FILES"
    # code
    bind \co "code (repo list -p | fzf )"
end

# starship
starship init fish | source


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
    eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

