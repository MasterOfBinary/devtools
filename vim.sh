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

bundle="$HOME/.vim/bundle"

# Install vim-airline and vim-airline-themes
try_clone https://github.com/vim-airline/vim-airline "$bundle/vim-airline"
try_clone https://github.com/vim-airline/vim-airline-themes "$bundle/vim-airline-themes"

# Install gruvbox colour scheme
try_clone https://github.com/morhetz/gruvbox "$bundle/gruvbox"

# Install vim-go
try_clone https://github.com/fatih/vim-go.git "$bundle/vim-go"

# Install vim-markdown
try_clone https://github.com/plasticboy/vim-markdown.git "$bundle/vim-markdown"

# Install NERDTree
try_clone https://github.com/preservim/nerdtree.git "$bundle/nerdtree"

echook

echo
echoinfo "Make sure to run :Helptags after opening vim!"
echo

