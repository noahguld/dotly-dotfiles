#!/bin/bash

function install {
    if [ $OS = "OSX" ]; then
        brew-cask-install-with-tap "homebrew/cask" "spectacle"

        link_file $MODULE_DIR/Shortcuts.js ~/Library/Application\ Support/Spectacle/Shortcuts.json
    else
        err "iTerm only supports OSX"
    fi
}
