#!/usr/bin/env bash

# Exit if any command fails
set -e

# Source common functions
. ./base

# Back up existing .zshrc
backup ~/.zshrc

# Copy new .zshrc
echo "Copying new .zshrc"
cp zsh/zshrc ~/.zshrc

# Install zsh plugins
echo "Installing zsh plugins..."

# Create zsh plugins directory
mkdir -p ~/.zsh

# Install zsh-autosuggestions
if [ ! -d ~/.zsh/zsh-autosuggestions ]; then
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi

# Install zsh-syntax-highlighting
if [ ! -d ~/.zsh/zsh-syntax-highlighting ]; then
    echo "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
fi

# Install pure prompt
if [ ! -d ~/.zsh/pure ]; then
    echo "Installing pure prompt..."
    git clone https://github.com/sindresorhus/pure.git ~/.zsh/pure
fi

# Create private env file if it doesn't exist
if [ ! -f ~/.zshenv.private ]; then
    echo "Creating private environment file from template..."
    cp zsh/zshenv.private.template ~/.zshenv.private
    echo "Edit ~/.zshenv.private to add your API keys and tokens"
fi

echo "Done! Restart your shell or run: source ~/.zshrc"
