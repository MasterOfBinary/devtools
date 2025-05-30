#!/usr/bin/env bash

# Exit if any command fails
set -e

. base

echosuccess "Setting up nvim..."

# Check if fzf is installed (needed for fzf.vim)
if ! command -v fzf > /dev/null; then
    echowarn "fzf is not installed. Consider installing it for better search functionality:"
    case "$OSID" in
        ubuntu)
            echowarn "  sudo apt install fzf"
            ;;
        arch)
            echowarn "  sudo pacman -S fzf"
            ;;
        darwin)
            echowarn "  brew install fzf"
            ;;
    esac
fi

# Check if ripgrep is installed (needed for :Rg command)
if ! command -v rg > /dev/null; then
    echowarn "ripgrep is not installed. Consider installing it for better grep functionality:"
    case "$OSID" in
        ubuntu)
            echowarn "  sudo apt install ripgrep"
            ;;
        arch)
            echowarn "  sudo pacman -S ripgrep"
            ;;
        darwin)
            echowarn "  brew install ripgrep"
            ;;
    esac
fi

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p "$HOME/.config/nvim"
backup "$HOME/.config/nvim/init.vim"
cp nvim/init.vim "$HOME/.config/nvim/init.vim"

# Create undo directory for persistent undo
mkdir -p "$HOME/.config/nvim/undodir"

# Install all plugins
nvim +'PlugInstall --sync' +'Helptags' +qa

# Note: colorscheme is already set in init.vim, no need to append it

echook
echo

