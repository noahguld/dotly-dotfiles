#!/bin/bash

CURRENT_PROFILE_FILE="$dotfilesDirectory/.current-profile"

function install {
    [[ ! $1 ]] && help_err install
    PROFILE_FILE=$1

    if [ ! -f "$PROFILE_FILE" ]; then
	err "$EX_ERR" "Profile file [$PROFILE_FILE] not found"

    fi

    info "Installing profile from [$PROFILE_FILE]"

    link_file_force $PROFILE_FILE $CURRENT_PROFILE_FILE

    CURRENT_PROFILE_DIR="$(cd "$(dirname "$(readlink $CURRENT_PROFILE_FILE)" )" && pwd -P)"

    input=$CURRENT_PROFILE_FILE
    while IFS= read -r line
    do
	MODULE=$line
	MODULE_DIR="$CURRENT_PROFILE_DIR/$MODULE"
	info "Installing $MODULE from $MODULE_DIR"
	if [ -d $MODULE_DIR ]; then
	    success "Installed $MODULE"
	else
	    fail "Did not find $MODULE_DIR" "Skipping..."
	fi
    done < "$input"

    return "$EX_SUCCESS"
}
