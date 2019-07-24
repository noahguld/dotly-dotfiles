#!/bin/sh

function install {
	if [ ! -d ~/.pyenv ]; then
		curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer
	fi

	cd $(mktemp -d)
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	sudo python get-pip.py
	cd -
}
