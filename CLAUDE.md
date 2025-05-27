# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a personal development environment setup tool that automates the installation and configuration of common development tools (zsh, nvim, screen, go) on Linux/Mac systems. It creates a consistent development environment with a focus on Go development.

## Key Commands

### Setup Commands
- `make` or `make all` - Install all tools (zsh, nvim, screen, go)
- `make zsh` - Install zsh with oh-my-zsh and powerlevel10k
- `make nvim` - Configure neovim for Go development
- `make screen` - Setup GNU screen
- `make go` - Create Go directory structure
- `make help` - Show available targets

### Go Development (in nvim)
- `,b` - Build Go files (GoBuild or GoTestCompile)
- `,r` - Run current Go file
- `,c` - Toggle code coverage
- `,s` - Show implementations
- `,e` - Rename symbol
- `,i` - Show type info
- `Ctrl+n` / `Ctrl+m` - Navigate between errors
- Files are automatically formatted with goimports and linted with golangci-lint on save

## Architecture Overview

### Core Components
1. **base** - Shared utilities script that:
   - Detects OS (ubuntu, arch, darwin)
   - Provides colored output functions
   - Handles file backups
   - Loads configuration from `config` file

2. **Individual setup scripts** (*.sh files):
   - Each tool has its own setup script
   - Scripts are independent but share common functions from `base`
   - All scripts use `set -e` for error handling

3. **Configuration storage**:
   - Tool configs are stored in subdirectories (zsh/, nvim/, screen/)
   - Central configuration in `config` file controls backup behavior and paths

### Important Configuration
- `DT_BACKUP` - Whether to backup existing files (default: true)
- `DT_DIR` - Where to install devtools binaries ($HOME/.devtools)
- `DT_GOPATH` - Go workspace directory ($HOME/go)
- vim-go uses gopls for language server features
- golangci-lint replaces the deprecated gometalinter

### OS Compatibility
The scripts only work on systems with OS ID of:
- `ubuntu`
- `arch`
- `darwin` (macOS)

To add support for other distros, modify the case statement in the `base` file around line 49.

## Development Notes

- Never requires sudo - users must install system packages first
- kubectl is conditionally loaded in zshrc to prevent errors if not installed
- The nvim Go setup requires golangci-lint to be installed separately
- gopls is automatically installed by vim-go on first use