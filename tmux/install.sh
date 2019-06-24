#!/bin/sh

function install {
    if [ ! -d ~/.tmux/plugins/tpm ]; then
        info "Installing tmux tpm"
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    else
        info "tmux tpm already installed"
    fi
}
