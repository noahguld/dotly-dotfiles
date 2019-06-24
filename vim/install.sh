#!/bin/sh

function install {
    mkdir -p ~/.config/nvim/
    link_file $MODULE_DIR/.vimrc ~/.vimrc
    link_file $MODULE_DIR/.ycm_extra_conf.py ~/.ycm_extra_conf.py
    link_file $MODULE_DIR/init.vim ~/.config/nvim/init.vim
    link_file $MODULE_DIR/cheat40.txt ~/.config/nvim/cheat40.txt

    pip3 install setuptools
    pip3 install --user neovim

    nvim +PlugInstall +qall
}
