#!/bin/sh

function install {
    mkdir -p ~/.ctags.d/
    link_file ${MODULE_DIR}/defaults.ctags ~/.ctags.d/defaults.ctags
    link_file ${MODULE_DIR}/.clang-format ~/.clang-format
    link_file ${MODULE_DIR}/.clang-tidy ~/.clang-tidy

    if [ $OS = "OSX" ]; then
        if xcode-select --install 2>&1 | grep installed; then
            info "xcode cmdline tools installed already"
        else
            info "Installing xcode cmdline tools"
            xcode-select --install
        fi
    fi
}
