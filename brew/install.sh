#!/bin/sh

function install {
    if [ $OS = "OSX" ]; then
        which brew > /dev/null
        if [[ $? = 0 ]] ; then
            info "brew already installed"
            info "updating..."
            brew update
        else
            info "Installing brew"
            ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        fi
    else
        err "Brew is not supported on systems other than OSX"
    fi
}
