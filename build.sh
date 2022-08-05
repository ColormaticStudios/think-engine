#!/bin/bash
# tputcolors


if [ -n "$1" ]; then #test if there is an argument
  #if there is, test what it is.
  if [ "$1" == "-r" ]; then
    mode="release"
  else
    if [ "$1" == "-d" ]; then
      mode="debug"
    else
      echo "$(tput setaf 1)$(tput bold)ERROR:$(tput sgr0) you have given an incorrect argument. The build process will attempt to continue."
    fi
  fi
  echo "$(tput setaf 2)building thinking engine...$(tput sgr0)"

  if [ ! -d "./bin" ]; then #test if the bin file exists
    mkdir bin #if not, make it
  fi
  crystal build src/main.cr -o bin/think --error-trace --$mode #actually build the program with the build options


  if [ "$?" == 0 ]; then #test if the build was successful
     echo "build successful."
  else
     echo "$(tput setaf 1)$(tput bold)ERROR:$(tput sgr0) build failed with exit code $?"
  fi

else
  echo "$(tput setaf 1)$(tput bold)ERROR:$(tput sgr0) you did not specify a build mode. Either add -r for release or -d for debug."
fi
