#!/bin/bash

NAME="audio_player"
BUILD_DIR="build"

GREEN="\033[0;32m"
END="\033[0m"

export CC=/usr/bin/cc
export CXX=/usr/bin/c++

function show_help() 
{
  echo "Usage: ./configure.sh [OPTIONS]"
  echo
  echo "Options :"
  echo "  --clean                  Delete build folder"
  echo "  --help                   Show this help"
}

for arg in "$@"; do
  case $arg in
    --clean)
      rm -rf "$BUILD_DIR"
      rm $NAME
      printf "\n$GREEN  Build folder cleaned$END\n"
      printf "\n$GREEN  Binary cleaned$END\n\n"
      exit 0
      ;;
    --help)
      show_help
      exit 0
      ;;
    *)
      echo "Invalid argument : $arg"
      show_help
      exit 1
      ;;
  esac
done

if [ -d "$BUILD_DIR" ]; then
    rm -rf "$BUILD_DIR"
    printf "\n$GREEN  Build folder cleaned$END\n"
fi

if [ -f "$NAME" ]; then
  rm "$NAME"
  printf "\n$GREEN  Binary cleaned$END\n\n"
fi

mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

cmake ..
make