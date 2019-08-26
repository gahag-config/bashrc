#!/bin/bash

cd $(dirname $(readlink -f $0)) # jump to the script directory

ln -s "$(pwd)/bashrc" ~/.bashrc

if [ -z "$HISTFILE" ]; then
    echo "HISTFILE not defined, skipping...";
else
  mkdir -p "$(dirname $HISTFILE)"
fi


if [ -z "$INPUTRC" ]; then
    echo "INPUTRC not defined, skipping...";
else
  mkdir -p "$(dirname $INPUTRC)"
  ln -s "$(pwd)/inputrc" "$INPUTRC"
fi
