#!/bin/sh

function install {
	if [ ! -d ~/.pyenv ]; then
		curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer
	fi
}
