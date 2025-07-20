#!/usr/bin/env bash

# Minimal zsh setup with Pure prompt
# No oh-my-zsh dependency, just essential plugins

set -e
. base

echosuccess "Installing minimal zsh setup with Pure prompt..."

# Create zsh directories
mkdir -p "$HOME/.zsh/plugins"
mkdir -p "$HOME/.zsh/prompt"

# Install Pure prompt
echoinfo "Installing Pure prompt..."
if [ ! -d "$HOME/.zsh/prompt/pure" ]; then
    git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/prompt/pure"
else
    echoinfo "Pure prompt already installed"
fi

# Install essential plugins
echoinfo "Installing essential zsh plugins..."

# zsh-completions - extra completions for many tools
if [ ! -d "$HOME/.zsh/plugins/zsh-completions" ]; then
    git clone https://github.com/zsh-users/zsh-completions.git "$HOME/.zsh/plugins/zsh-completions"
else
    echoinfo "zsh-completions already installed"
fi

# zsh-syntax-highlighting - command syntax highlighting
if [ ! -d "$HOME/.zsh/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh/plugins/zsh-syntax-highlighting"
else
    echoinfo "zsh-syntax-highlighting already installed"
fi

# zsh-autosuggestions - suggest commands from history
if [ ! -d "$HOME/.zsh/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$HOME/.zsh/plugins/zsh-autosuggestions"
else
    echoinfo "zsh-autosuggestions already installed"
fi

# Install zoxide (better z) if available via package manager
echoinfo "Checking for zoxide..."
if ! command -v zoxide &> /dev/null; then
    echowarn "zoxide not found. Install it manually for better directory jumping:"
    case "$distro" in
        "darwin")
            echowarn "  brew install zoxide"
            ;;
        "ubuntu")
            echowarn "  curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash"
            ;;
        "arch")
            echowarn "  pacman -S zoxide"
            ;;
    esac
else
    echook "zoxide is already installed"
fi

# Backup existing configs
backup "$HOME/.zshrc"
backup "$HOME/.zsh/aliases.zsh"

# Copy our minimal configs
echoinfo "Installing zsh configuration..."
cp zsh/zshrc "$HOME/.zshrc"
cp zsh/aliases.zsh "$HOME/.zsh/aliases.zsh"

echook
echo
echoinfo "Minimal zsh setup complete!"
echo
echoinfo "Features installed:"
echoinfo "  - Pure prompt (minimal and fast)"
echoinfo "  - Syntax highlighting"
echoinfo "  - Auto suggestions"
echoinfo "  - Extended completions"
echoinfo "  - Personal aliases in ~/.zsh/aliases.zsh"
echo
echoinfo "Run 'zsh' or start a new terminal to use your new shell!"