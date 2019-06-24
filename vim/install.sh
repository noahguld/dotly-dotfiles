#!/bin/sh

function install {
    mkdir -p ~/.config/nvim/
    link_file $MODULE_DIR/.vimrc ~/.vimrc
    link_file $MODULE_DIR/.ycm_extra_conf.py ~/.ycm_extra_conf.py
    link_file $MODULE_DIR/init.vim ~/.config/nvim/init.vim
    link_file $MODULE_DIR/cheat40.txt ~/.config/nvim/cheat40.txt

    if [ $OS = "OSX" ]; then
        if ! brew ls --versions neovim > /dev/null; then
            info "Installing neovim"
            brew install neovim
        else
            info "neovim already installed"
        fi
    fi

    #nvim '+PlugInstall' '+qall'
}
