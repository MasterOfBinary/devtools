#!/usr/bin/env bash

# Exit if any command fails
set -e

. base

echosuccess "Installing tmux..."

# Install tmux package
case "$OSID" in
    ubuntu)
        echoinfo "Installing tmux package..."
        if ! command -v tmux > /dev/null; then
            echoerror "tmux is not installed. Please run: sudo apt install tmux"
            exit 1
        fi
        ;;
    arch)
        echoinfo "Installing tmux package..."
        if ! command -v tmux > /dev/null; then
            echoerror "tmux is not installed. Please run: sudo pacman -S tmux"
            exit 1
        fi
        ;;
    darwin)
        echoinfo "Installing tmux package..."
        if ! command -v tmux > /dev/null; then
            echoerror "tmux is not installed. Please run: brew install tmux"
            exit 1
        fi
        ;;
esac

# Check tmux version (need 2.6+)
TMUX_VERSION=$(tmux -V | cut -d' ' -f2)
REQUIRED_VERSION="2.6"
if [ "$(printf '%s\n' "$REQUIRED_VERSION" "$TMUX_VERSION" | sort -V | head -n1)" != "$REQUIRED_VERSION" ]; then
    echoerror "tmux version $TMUX_VERSION is too old. Need at least $REQUIRED_VERSION"
    exit 1
fi

echoinfo "Installing gpakosz/.tmux configuration..."

# Backup existing configs if they exist
backup "$HOME/.tmux.conf"
backup "$HOME/.tmux.conf.local"

# Clone gpakosz/.tmux
if [ -d "$HOME/.tmux" ]; then
    echoinfo "Updating existing .tmux installation..."
    pushd "$HOME/.tmux" > /dev/null
    git pull
    popd > /dev/null
else
    echoinfo "Cloning gpakosz/.tmux..."
    git clone https://github.com/gpakosz/.tmux.git "$HOME/.tmux"
fi

# Create symlinks
ln -sf "$HOME/.tmux/.tmux.conf" "$HOME/.tmux.conf"

# Create our local configuration
pushd tmux > /dev/null

if [ -f tmux.conf.local ]; then
    cp tmux.conf.local "$HOME/.tmux.conf.local"
else
    # Create a basic local config with powerline enabled
    cat > "$HOME/.tmux.conf.local" << 'EOF'
# Enable powerline symbols
tmux_conf_theme_left_separator_main='\uE0B0'
tmux_conf_theme_left_separator_sub='\uE0B1'
tmux_conf_theme_right_separator_main='\uE0B2'
tmux_conf_theme_right_separator_sub='\uE0B3'

# Enable mouse support
set -g mouse on

# Set terminal
set -g default-terminal "xterm-256color"

# Increase history limit
set -g history-limit 10000

# Start windows and panes at 1, not 0
set -g base-index 1
setw -g pane-base-index 1

# Renumber windows when one is closed
set -g renumber-windows on

# Enable focus events
set -g focus-events on

# Set escape time to 0
set -sg escape-time 0

# Battery display (requires battery command)
tmux_conf_theme_battery_status='#(battery -pc)'
EOF
fi

popd > /dev/null

# Check for powerline fonts
echoinfo "Checking for powerline fonts..."
if ! fc-list | grep -qi "powerline\|nerd\|meslo.*for.*powerline"; then
    echowarn "Powerline fonts not detected. Consider installing:"
    echowarn "  - https://github.com/powerline/fonts"
    echowarn "  - https://github.com/ryanoasis/nerd-fonts"
    echowarn "  - Or use a terminal with built-in powerline support"
fi

echook "tmux with gpakosz/.tmux configuration installed successfully!"
echoinfo "Start tmux with: tmux"
echoinfo "Customize in: ~/.tmux.conf.local"