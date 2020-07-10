#!/usr/bin/env bash

# Exit if any command fails
set -e

. base

echo "Installing zsh..."

pushd zsh > /dev/null

backup "$HOME/.zshrc"
backup "$HOME/.p10k.zsh"

# Install oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# Copy config files
cp zshrc "$HOME/.zshrc"
cp p10k.zsh "$HOME/.p10k.zsh"

popd > /dev/null

echook

echo
echoinfo "Run zsh or log out and log in to see the updated zsh!"

