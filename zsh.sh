#!/usr/bin/env bash

# Exit if any command fails
set -e

. base

echosuccess "Installing zsh..."

pushd zsh > /dev/null

# Install oh-my-zsh
sh -c "$(wget  -q --show-progress -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Sometimes ZSH_CUSTOM doesn't seem to exist yet so just assume it's in the default location. There's probably
# a better way to do it...

# Install powerlevel10k theme
# NOTE: don't use try_clone here because it assumes 2 arguments which is bad but I'm too lazy to fix it.
# Regardless, ohmyzsh would've checked already that .oh-my-zsh doesn't exist.
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"

# Install zsh-autosuggestions
try_clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

# Install zsh-autosuggestions
try_clone https://github.com/zsh-users/zsh-completions "$HOME/.oh-my-zsh/custom/plugins/zsh-completions"

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
echo

