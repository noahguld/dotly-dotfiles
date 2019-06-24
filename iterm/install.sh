#!/bin/bash

function install {
    if [ $OS = "OSX" ]; then
        if ! brew cask ls --versions iTerm2 > /dev/null; then
            info "Installing iTerm2"
            brew tap caskroom/cask
            brew cask install iTerm2
        else
            info "iTerm2 already installed"
        fi

        # Specify the preferences directory
        defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "${MODULES_DIR}/profile"
        # Tell iTerm2 to use the custom preferences in the directory
        defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
    else
        err "iTerm only supports OSX"
    fi
}
