#!/bin/bash

current_profile_file=".current-profile"

function install {
    [[ ! $1 ]] && help_err install

    return "$EX_SUCCESS"
}
