#!/usr/bin/env bash

# Exit if any command fails
set -e

. base

echo "Installing vim..."

mkdir -p "$HOME/.vim/autoload" "$HOME/.vim/bundle"

wget -O "$HOME/.vim/autoload/pathogen.vim" https://tpo.pe/pathogen.vim

pushd vim > /dev/null

backup "$HOME/.vimrc"
cp vimrc "$HOME/.vimrc"

popd > /dev/null

# Install badwolf colour scheme
git clone https://github.com/sjl/badwolf "$HOME/.vim/bundle/badwolf"

# Install vim-go
git clone https://github.com/fatih/vim-go.git "$HOME/.vim/bundle/vim-go"

echook

