#!/bin/sh

function install {
    mkdir -p ~/.ctags.d/
    link_file ${MODULE_DIR}/defaults.ctags ~/.ctags.d/defaults.ctags
    link_file ${MODULE_DIR}/.clang-format ~/.clang-format
    link_file ${MODULE_DIR}/.clang-tidy ~/.clang-tidy
}
