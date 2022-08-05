#!/bin/bash
# tputcolors


if [ -n "$1" ]; then
  if [ "$1" == "-r" ]; then
    mode="release"
  else
    if [ "$1" == "-d" ]; then
      mode="debug"
    fi
  fi
  echo "building thinking engine..."

  if [ ! -d "./bin" ]; then
    mkdir bin
  fi
  crystal build src/main.cr -o bin/think --error-trace --$mode


  if [ "$?" == 0 ]; then
     echo "build successful."
  else
     echo "$(tput setaf 1)$(tput bold)ERROR:$(tput sgr0) build failed with exit code $?"
  fi

else
  echo "$(tput setaf 1)$(tput bold)ERROR:$(tput sgr0) you did not specify a build mode. Either add -r for release or -d for debug."
fi
