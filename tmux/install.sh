#!/bin/sh

function install {
    link_file $MODULE_DIR/.tmux.conf ~/.tmux.conf

    if [ $OS = "OSX" ]; then
        brew-install "tmux"
    fi

    if [ ! -d ~/.tmux/plugins/tpm ]; then
        info "Installing tmux tpm"
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    else
        info "tmux tpm already installed"
    fi
}
