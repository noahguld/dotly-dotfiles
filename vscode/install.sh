#!/bin/sh

function install {
    if [ $OS = "OSX" ]; then
        if ! brew cask ls --versions visual-studio-code > /dev/null; then
            info "Installing vscode"
            brew tap caskroom/cask
            brew cask install visual-studio-code
        else
            info "vscode already installed"
        fi
    fi

    if test "$(which code)"; then
        info "Linking vscode config files"

        if [ $OS = "OSX" ]; then
            VSCODE_HOME="$HOME/Library/Application Support/Code"
        else
            VSCODE_HOME="$HOME/.config/Code"
        fi

        #link_file "$MODULE_DIR/keybindings.json" "$VSCODE_HOME/User/keybindings.json"
        link_file "$MODULE_DIR/settings.json" "$VSCODE_HOME/User/settings.json"

        echo "Installing vscode plugins"

        # from `code --list-extensions`
        modules="
        2gua.rainbow-brackets
        DavidAnson.vscode-markdownlint
        DotJoshJohnson.xml
        LaurentTreguier.uncrustify
        dracula-theme.theme-dracula
        fallenwood.vimL
        hnw.vscode-auto-open-markdown-preview
        mitaki28.vscode-clang
        ms-python.python
        ms-vscode.cpptools
        tomphilbin.gruvbox-themes
        twxs.cmake
        vscodevim.vim
        wayou.vscode-todo-highlight
        xaver.clang-format"
        for module in $modules; do
            code --install-extension "$module" || true
        done
    fi
}
