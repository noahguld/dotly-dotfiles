#!/bin/bash

SOURCE=$0
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

parentDirectory="$(cd "$( dirname "$0" )" && pwd -P)"
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
      if [[ -e ${MODULE_DIR}/startup.sh ]]; then
          source ${MODULE_DIR}/startup.sh
      fi
      if [[ -n "$BASH" ]] && [[ -e ${MODULE_DIR}/startup.bash ]]; then
          source ${MODULE_DIR}/startup.bash
      fi
      if [[ -n "$ZSH_NAME" ]] && [[ -e ${MODULE_DIR}/startup.zsh ]]; then
          source ${MODULE_DIR}/startup.zsh
      fi
    fi
done < "$input"
