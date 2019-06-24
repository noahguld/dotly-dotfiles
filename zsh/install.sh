#!/bin/bash

function install {

    # Install zsh
    if [ $OS = "OSX" ]; then
        brew-install "zsh"
        brew-install "zsh-completions"
        brew-install "zsh-autosuggestions"
        brew-install-with-tap "getantibody/tap" "getantibody/tap/antibody"
    fi

    # Set zsh as the default shell
    if ! echo $SHELL | grep -q 'zsh'; then
        info "Setting zsh as default shell"
        # Add zsh to valid shells
        sudo sh -c "grep -q -F \"$(which zsh)\" /etc/shells" || sudo sh -c "echo \"$(which zsh)\" >> /etc/shells"
        # set zsh default
        chsh -s $(which zsh)
    else
        info "zsh is already the default shell"
    fi

    link_file $MODULE_DIR/.zshrc ~/.zshrc
}
