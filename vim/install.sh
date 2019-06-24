#!/bin/sh

function install {
    mkdir -p ~/.config/nvim/
    link_file $MODULE_DIR/.vimrc ~/.vimrc
    link_file $MODULE_DIR/.ycm_extra_conf.py ~/.ycm_extra_conf.py
    link_file $MODULE_DIR/init.vim ~/.config/nvim/init.vim
    link_file $MODULE_DIR/cheat40.txt ~/.config/nvim/cheat40.txt

    if [ $OS = "OSX" ]; then
        brew-cask-install-with-tap "homebrew/cask" "font-ubuntu"
        brew-cask-install-with-tap "homebrew/cask" "font-ubuntumono-nerd-font"
        brew-install "vim" "--with-override-system-vi"
        brew-install-with-tap "neovim/neovim" "neovim"
        brew-install "ag"
        brew-install "python"
        brew-install "python3"
    fi

    #curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	#python get-pip.py
}
