#!/usr/bin/env bash

# Exit if any command fails
set -e

. base

echosuccess "Installing screen..."

mkdir -p "$HOME/.screen"
chmod 0700 "$HOME/.screen"

pushd screen > /dev/null

backup "$HOME/.screenrc"
cp screenrc "$HOME/.screenrc"

popd > /dev/null

echook

