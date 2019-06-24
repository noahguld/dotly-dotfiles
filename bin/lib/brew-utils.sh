#!/bin/bash

function brew-install {
    local BREW_MODULE="$1"
    local BREW_MODULE_ARGS="${@:2}"

    if ! brew ls --versions $BREW_MODULE > /dev/null; then
        info "Installing $BREW_MODULE"
        brew install $BREW_MODULE $BREW_MODULE_ARGS
    else
        info "$BREW_MODULE already installed"
    fi
}

function brew-install-with-tap {
    local BREW_TAP="$1"
    local BREW_MODULE="$2"
    local BREW_MODULE_ARGS="${@:3}"

    brew tap $BREW_TAP
    brew-install $BREW_MODULE $BREW_MODULE_ARGS
}

function brew-cask-install {
    local CASK_MODULE="$1"

    if ! brew cask ls --versions $CASK_MODULE > /dev/null; then
        info "Installing $CASK_MODULE"
        brew cask install $CASK_MODULE
    else
        info "$CASK_MODULE already installed"
    fi
}

function brew-cask-install-with-tap {
    local CASK_TAP="$1"
    local CASK_MODULE="$2"
    local CASK_MODULE_ARGS="${@:3}"

    brew tap $CASK_TAP
    brew-cask-install $CASK_MODULE
}
