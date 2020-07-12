#!/usr/bin/env bash

# Exit if any command fails
set -e

. base

echosuccess "Setting up nvim..."

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

backup "$HOME/.config/nvim/init.vim"
cp nvim/init.vim "$HOME/.config/nvim/init.vim"

# Install all plugins
nvim +'PlugInstall --sync' +qa

# Update help tags
nvim +'Helptags --sync' +qa

# Set the colour scheme *after* installing plugins to avoid a warning when the colour scheme doesn't exist
cat <<EOF >> "$HOME/.config/nvim/init.vim"

" Colour scheme
colorscheme gruvbox     " awesome colorscheme
syntax enable           " enable syntax processing

EOF

echook
echo

