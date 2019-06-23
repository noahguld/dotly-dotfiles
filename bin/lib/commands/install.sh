#!/bin/bash

function install {
    [[ ! $1 ]] && help_err install
    local PROFILE_FILE=$1

    if [ ! -f "$PROFILE_FILE" ]; then
	err "$EX_ERR" "Profile file [$PROFILE_FILE] not found"
    fi

    info "Installing profile from [$PROFILE_FILE]"

    link_file_force $PROFILE_FILE $CURRENT_PROFILE_FILE

    local CURRENT_PROFILE_DIR="$(cd "$(dirname "$(readlink $CURRENT_PROFILE_FILE)" )" && pwd -P)"

    input=$CURRENT_PROFILE_FILE
    while IFS= read -r line
    do
	local MODULE=$line
	local MODULE_DIR="$CURRENT_PROFILE_DIR/$MODULE"
	info "Installing $MODULE from $MODULE_DIR"
	if [ -d $MODULE_DIR ]; then
	    local INSTALLER="$MODULE_DIR/install.sh"
	    if [ -f $INSTALLER ]; then
		info "Running $MODULE install() function"
		source $INSTALLER && install
		unset -f install
	    else
		info "No install.sh found"
	    fi
	    success "Installed $MODULE"
	else
	    fail "Did not find $MODULE_DIR" "Skipping..."
	fi
    done < "$input"

    return "$EX_SUCCESS"
}
