#!/bin/bash

function install {
    if [ $OS = "OSX" ]; then
        brew-cask-install-with-tap "homebrew/cask" "spectacle"

        link_file $MODULE_DIR/Shortcuts.json ~/Library/Application\ Support/Spectacle/Shortcuts.json
    else
        err "Spectacle only supports OSX"
    fi
}
