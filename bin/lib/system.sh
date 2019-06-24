#!/bin/sh

OS=
case "$OSTYPE" in
  solaris*) OS="SOLARIS" ;;
  darwin*)  OS="OSX" ;;
  linux*)   OS="LINUX" ;;
  bsd*)     OS="BSD" ;;
  msys*)    OS="WINDOWS" ;;
  *)        OS="unknown: $OSTYPE" ;;
esac

EGREP=$(which egrep)

function pathmunge {
  if ! echo $PATH | $EGREP -q "(^|:)$1($|:)" ; then
      if [ "$2" = "after" ] ; then
          PATH=$PATH:$1
      else
          PATH=$1:$PATH
      fi
  fi
}
