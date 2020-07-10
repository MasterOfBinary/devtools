#!/usr/bin/env bash

# Exit if any command fails
set -e

. base

echo -n "Installing zsh... "

pushd zsh

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

backup "$HOME/.zshrc"
cp zshrc "$HOME/.zshrc"

popd

echook

