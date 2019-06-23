#!/bin/bash

parentDirectory="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P)"
dotfilesDirectory="$(cd "$( dirname "$parentDirectory" )" && pwd -P)"
libDirectory="$parentDirectory/lib"

CURRENT_PROFILE_FILE="$dotfilesDirectory/.current-profile"
CURRENT_PROFILE_DIR="$(cd "$(dirname "$(readlink $CURRENT_PROFILE_FILE)" )" && pwd -P)"

input=$CURRENT_PROFILE_FILE
while IFS= read -r line
do
    local MODULE=$line
    local MODULE_DIR="$CURRENT_PROFILE_DIR/$MODULE"
    if [ -d $MODULE_DIR ]; then
        local STARTUP_FILE="$MODULE_DIR/startup.sh"
        if [ -f $STARTUP_FILE ]; then
            source $STARTUP_FILE
        fi
    fi
done < "$input"
