#!/usr/bin/env bash

# Exit if any command fails
set -e

. base

echosuccess "Setting up go..."

go version

mkdir -p "$DT_GOPATH"
mkdir -p "$DT_GOPATH/src"
mkdir -p "$DT_GOPATH/bin"

# Add env vars to zshrc only if not already present
if ! grep -q "^export GOPATH=" "$HOME/.zshrc"; then
    echo "# Go environment variables" >> "$HOME/.zshrc"
    echo "export PATH=\"$DT_GOPATH/bin:\$PATH\"" >> "$HOME/.zshrc"
    echo "export GOPATH=\"$DT_GOPATH\"" >> "$HOME/.zshrc"
    
    if [ ! -z "$DT_GOPRIVATE" ]; then
        echo "export GOPRIVATE=\"$DT_GOPRIVATE\"" >> "$HOME/.zshrc"
    fi
    
    echo >> "$HOME/.zshrc"
    echoinfo "Added Go environment variables to .zshrc"
else
    echoinfo "Go environment variables already configured in .zshrc"
fi

echook

