#!/bin/bash

function install {
    if [ $OS = "OSX" ]; then
        if xcode-select --install 2>&1 | grep installed; then
            info "xcode cmdline tools installed already"
        else
            info "Installing xcode cmdline tools"
            xcode-select --install
        fi
    fi

    brew bundle --file=${MODULE_DIR}/Brewfile
}
