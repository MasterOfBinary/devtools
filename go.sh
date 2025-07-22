#!/usr/bin/env bash

# Exit if any command fails
set -e

. base

echosuccess "Setting up go..."

go version

mkdir -p "$DT_GOPATH"
mkdir -p "$DT_GOPATH/src"
mkdir "$DT_GOPATH/bin"

# Create modular Go configuration file
GO_ENV_FILE="$HOME/.zsh.go.env"
echoinfo "Creating Go environment file at $GO_ENV_FILE..."
{
	echo "# Go environment variables (managed by devtools)"
	echo "export PATH=\"$DT_GOPATH/bin:\$PATH\""
	echo "export GOPATH=\"$DT_GOPATH\""
	if [ ! -z "$DT_GOPRIVATE" ]; then
		echo "export GOPRIVATE=\"$DT_GOPRIVATE\""
	fi
} > "$GO_ENV_FILE"
echosuccess "Go configuration written to $GO_ENV_FILE"

echook

