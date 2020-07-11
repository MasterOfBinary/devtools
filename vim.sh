#!/usr/bin/env bash

# Exit if any command fails
set -e

. base

echosuccess "Installing vim..."

mkdir -p "$HOME/.vim/autoload" "$HOME/.vim/bundle"

wget -q --show-progress -O "$HOME/.vim/autoload/pathogen.vim" https://tpo.pe/pathogen.vim

pushd vim > /dev/null

backup "$HOME/.vimrc"
cp vimrc "$HOME/.vimrc"

popd > /dev/null

# Install vim-airline and vim-airline-themes
git clone https://github.com/vim-airline/vim-airline "$HOME/.vim/bundle/vim-airline"
git clone https://github.com/vim-airline/vim-airline-themes "$HOME/.vim/bundle/vim-airline-themes"

# Install gruvbox colour scheme
git clone https://github.com/morhetz/gruvbox "$HOME/.vim/bundle/gruvbox"

# Install vim-go
git clone https://github.com/fatih/vim-go.git "$HOME/.vim/bundle/vim-go"

echook

echo
echoinfo "Make sure to run :Helptags after opening vim!"
echo

