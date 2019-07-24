#!/bin/bash

function install {
    if [ $OS = "OSX" ]; then
        brew-cask-install-with-tap "homebrew/cask" "font-ubuntu"
        brew-cask-install-with-tap "homebrew/cask" "font-ubuntumono-nerd-font"
        brew-cask-install-with-tap "homebrew/cask" "iTerm2"

        # Specify the preferences directory
        defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "${MODULE_DIR}/profile"
        # Tell iTerm2 to use the custom preferences in the directory
        defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
    else
        err "iTerm only supports OSX"
    fi
}
