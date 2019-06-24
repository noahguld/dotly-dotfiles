#!/bin/bash

function install {

    # Install zsh
    if [ $OS = "OSX" ]; then
        if ! brew ls --versions zsh > /dev/null; then
            info "Installing zsh"
            brew install zsh
        else
            info "zsh already installed"
        fi

        if ! brew ls --versions zsh-completions > /dev/null; then
            info "Installing zsh-completions"
            brew install zsh-completions
        else
            info "zsh-completions already installed"
        fi

        if ! brew ls --versions zsh-autosuggestions > /dev/null; then
            info "Installing zsh-autosuggestions"
            brew install zsh-autosuggestions
        else
            info "zsh-autosuggestions already installed"
        fi

        if ! brew ls --versions getantibody/tap/antibody > /dev/null; then
            info "Installing getantibody/tap/antibody"
            brew tap 'getantibody/tap'
            brew install getantibody/tap/antibody
        else
            info "getantibody/tap/antibody already installed"
        fi
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
