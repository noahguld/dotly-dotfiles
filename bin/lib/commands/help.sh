#!/bin/bash

# help is used globally
# shellcheck disable=SC2120
function help {
    if [[ $1 ]]; then
	extended_help "$1"
	exit "$EX_SUCCESS"
    fi

    printf "Who doesn't want another dotfile manager
     Usage: dotly [options] TASK
     Tasks:
        dotly install [PROFILE]         # Install a profile
	dotly help [TASK]           	# Show usage of a task
     Runtime options:
       -q, [--quiet]    # Suppress status output
       -f, [--force]    # Overwrite files that already exist
       -v, [--verbose]  # Verbose-mode: Detailed status output
    "
}

function extended_help {
    case $1 in
    install)
	printf "Install a given profile\n"
	printf "Usage:\n  dotly %s [PROFILE]" "$1"
	;;
    help)
	printf "Shows usage of a task\n"
	printf "Usage:\n  dotly help [TASK]"
	;;
    *)
	# no args for help
	# shellcheck disable=SC2119
	help
	;;
    esac
    printf "\n\n"
}
