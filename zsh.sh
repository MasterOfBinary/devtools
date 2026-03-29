#!/usr/bin/env bash

# Exit if any command fails
set -e

. base

echosuccess "Installing zsh..."

pushd zsh > /dev/null

# Install zinit
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
else
	echoinfo "zinit already installed, skipping."
fi

# Copy config files
backup "$HOME/.zshrc"
cp zshrc "$HOME/.zshrc"
backup "$HOME/.p10k.zsh"
cp p10k.zsh "$HOME/.p10k.zsh"

popd > /dev/null

# Install z
mkdir -p "$DT_DIR"
wget  -q --show-progress -O "$DT_DIR/z.sh" https://raw.githubusercontent.com/rupa/z/master/z.sh

echook

echo
echoinfo "Run zsh or log out and log in to see the updated zsh!"
echoinfo "On first launch, zinit will automatically download and install plugins."
echo
