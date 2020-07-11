#!/usr/bin/env bash

# Exit if any command fails
set -e

. base

echosuccess "Installing zsh..."

pushd zsh > /dev/null

# Install oh-my-zsh
sh -c "$(wget  -q --show-progress -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

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

