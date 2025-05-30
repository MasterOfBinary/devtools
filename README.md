# Devtools

Devtools contains a makefile and a set of scripts for setting up my common dev tools (like `nvim` and `zsh`) in a newly installed Linux / Mac system so I have a consistent development environment every time. Currently it's mainly for setting things up for Go development.

## About

I put together this repo because I always have trouble setting up new development environments, which I find myself doing quite often for testing or just to check out a new Linux distro. This set of scripts can be run to give me the exact same environment every time.

Feel free to take it and modify it for your own use-case, but I would highly recommend not to use it as-is because it's specific to my own workflow and it's better to customize your own environment.

I've used devtools on Ubuntu, ArchLinux, and Mac OS X. It may work for other Linux distros as well, but I haven't tested it and have no plans to do so.

Currently the following tools are setup:

* `zsh` with `oh-my-zsh` and the `powerline10k` theme.
* `nvim` with `gruvbox` theme and modern Go development support using `vim-go`, `gopls`, and `golangci-lint`.
* `tmux` with the powerful gpakosz/.tmux configuration and powerline font support.
* `go` with configurable directory structure.

I will probably add more in the future, like Docker.

## Prerequisites

Devtools **will not install any system packages** - all required packages must be installed manually before running the scripts. The scripts will check for required packages and provide error messages if they're missing.

### Required Packages

Install these packages using your OS's package manager:

* `git` - For cloning repositories and version control
* `make` - For running the Makefile
* `wget` - For downloading files
* `unzip` - For extracting archives
* `zsh` - Shell that will be configured with oh-my-zsh
* `nvim` (neovim) - Text editor that will be configured
* `tmux` (version 2.6 or higher) - Terminal multiplexer

### Optional Packages

These enhance functionality but aren't required:

* `fzf` - Fuzzy finder for better search in nvim
* `ripgrep` (`rg`) - Fast grep alternative for better search in nvim
* `kubectl` - For Kubernetes development (if needed)

### Go Development (Optional)

If you want to use the Go development features:

* `go` - The Go programming language
* `golangci-lint` - Go linter (will be used by nvim)

Note: `gopls` (Go language server) will be automatically installed by vim-go on first use.

### Important Notes

* Make sure `zsh` is your default shell before running devtools (check your OS documentation)
* There's no need to run the zsh first-time setup - the `.zshrc` will be overwritten by devtools
* All packages must be installed with proper permissions (using `sudo` where needed)

Platform-specific installation instructions are available below for [Ubuntu](#ubuntu), [Arch Linux](#arch-linux), and [Mac OS X](#mac-os-x).

### Ubuntu

#### Required packages:

```
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install neovim zsh git make wget unzip tmux
```

#### Optional packages for enhanced functionality:

```
# For better search in nvim
sudo apt-get install fzf ripgrep
```

#### Optional: Kubernetes Development

```
# Install kubectl by following the official guide:
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
```

#### Optional: Go Development

```
# Download and install Go (replace version as needed)
wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc

# Verify installation
go version

# Install golangci-lint
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.61.0
```

Set default shell to `zsh`:

```
chsh -s /bin/zsh
```

Logout and login to use the new shell. Quit the new shell setup that opens when you first start zsh - shell setup will be overwritten by this application.

Proceed to the section on [Running](#running).

### Arch Linux

#### Required packages:

```
sudo pacman -Syu
sudo pacman -S neovim zsh git make wget unzip tmux
```

#### Optional packages for enhanced functionality:

```
# For better search in nvim
sudo pacman -S fzf ripgrep
```

#### Optional: Kubernetes Development

```
sudo pacman -S kubectl
```

#### Optional: Go Development

```
# Install Go
sudo pacman -S go

# Install golangci-lint via yay (AUR)
yay -S golangci-lint-bin

# Alternative: Install via curl
# curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.61.0
```

Set default shell to `zsh`:

```
chsh -s /bin/zsh
```

Logout and login to use the new shell. Quit the new shell setup that opens when you first start zsh - shell setup will be overwritten by this application.

Proceed to the section on [Running](#running).

### Mac OS X

On OS X Catalina or later, `zsh` will already be installed. If it's not, you can install it with Homebrew.

#### Required packages:

```
brew update && brew upgrade
brew install neovim git make wget unzip tmux
# Note: zsh is already included in macOS Catalina+
```

#### Optional packages for enhanced functionality:

```
# For better search in nvim
brew install fzf ripgrep
```

#### Optional: Kubernetes Development

```
brew install kubectl
```

#### Optional: Go Development

```
# Install Go
brew install go

# Install golangci-lint
brew install golangci-lint

# Alternative: Install golangci-lint via curl
# curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.61.0
```

Set default shell to `zsh`:

```
chsh -s /bin/zsh
```

Logout and login to use the new shell. Quit the new shell setup that opens when you first start zsh - shell setup will be overwritten by this application.

Proceed to the section on [Running](#running).

## Running

Clone the devtools repo:

```
git clone git@github.com:MasterOfBinary/devtools.git
```

Devtools needs to be run from its directory (i.e. the directory with the `Makefile`):

```
cd devtools
```

Edit the `config` file to your liking. You may be fine with the defaults.

Use `make` to install everything. No superuser privileges are required:

```
make
```

You can use `make help` to get a list of `make` targets:

```
Usage:
    make <target>

Targets:
    go                             Sets up go directories.
    help                           Shows help.
    nvim                           Sets up nvim with plugins and config files.
    tmux                           Sets up tmux with gpakosz/.tmux configuration.
    zsh                            Installs oh-my-zsh with powerline10k theme and config files.
```

For example, to just setup tmux, run:

```
make tmux
```

## Other

I like to set my terminal theme to the gruvbox theme, the same theme I'm using for `nvim`. For iterm2, download the theme at https://github.com/herrbischoff/iterm2-gruvbox and import it.

You'll also need powerline fonts for your terminal, otherwise some weird symbols will show up. My preference is Mononoki Nerd Font from https://www.nerdfonts.com/.

Also, I install `screenfetch` when zsh starts up. On Ubuntu, install it as follows:

1. Run `sudo apt-get install screenfetch`.
2. Remove execute permissions from all files in `/etc/update-motd.d` to hide all the other message of the days.
3. Create new file `/etc/update-motd.d/00-header-new` with execute permissions.

Add the following to the new `00-header-new` file:

```
#!/bin/sh

screenfetch
```
