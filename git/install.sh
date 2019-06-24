#!/bin/sh

function install {
    link_file $MODULE_DIR/.gitconfig ~/.gitconfig
    link_file $MODULE_DIR/.gitignore_global ~/.gitignore_global

    if [ $OS = "OSX" ]; then
        if ! brew ls --versions diff-so-fancy > /dev/null; then
            info "Installing diff-so-fancy"
            brew install diff-so-fancy
        else
            info "diff-so-fancy already installed"
        fi
    fi

    git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

    git config --global color.ui true

    git config --global color.diff-highlight.oldNormal    "red bold"
    git config --global color.diff-highlight.oldHighlight "red bold 52"
    git config --global color.diff-highlight.newNormal    "green bold"
    git config --global color.diff-highlight.newHighlight "green bold 22"

    git config --global color.diff.meta       "yellow"
    git config --global color.diff.frag       "magenta bold"
    git config --global color.diff.commit     "yellow bold"
    git config --global color.diff.old        "red bold"
    git config --global color.diff.new        "green bold"
    git config --global color.diff.whitespace "red reverse"

}
