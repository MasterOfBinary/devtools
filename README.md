# Devtools

Devtools contains a makefile and a set of scripts for setting up my common dev tools (like `nvim` and `zsh`) in a newly installed Linux / Mac system so I have a consistent development environment every time. Currently it's mainly for setting things up for Go development.

## About

I put together this repo because I always have trouble setting up new development environments, which I find myself doing quite often for testing or just to check out a new Linux distro. This set of scripts can be run to give me the exact same environment every time.

Feel free to take it and modify it for your own use-case, but I would highly recommend not to use it as-is because it's specific to my own workflow and it's better to customize your own environment.

I've used devtools on Ubuntu, ArchLinux, and Mac OS X. It may work for other Linux distros as well, but I haven't tested it and have no plans to do so.

Currently the following tools are setup:

* `zsh` with minimal configuration (no frameworks) including Pure prompt, syntax highlighting, and autosuggestions.
* `nvim` with `gruvbox` theme and modern Go development support using `vim-go`, `gopls`, and `golangci-lint`.
* `tmux` with minimal configuration, mouse support, and intuitive key bindings.
* `go` with configurable directory structure.

I will probably add more in the future, like Docker.

### Minimal Zsh Features

The minimal zsh configuration includes:
- Command history with deduplication and sharing between sessions
- Tab completion with case-insensitive menu selection
- Enhanced ls commands using `eza` with icons and colors
- Git aliases (gs, ga, gc, gp, gl, gd)
- [Pure](https://github.com/sindresorhus/pure) prompt (installed automatically)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) for fish-like suggestions
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) for command highlighting
- [fzf](https://github.com/junegunn/fzf) integration for fuzzy finding (Ctrl+R for history, Ctrl+T for files, Alt+C for directories)
- Private environment variables support via `~/.zshenv.private` (template provided)

### Minimal Tmux Features

The minimal tmux configuration includes:
- Mouse support enabled for clicking and scrolling
- Automatic window renumbering when one is closed
- Increased scrollback history (10000 lines)
- No delay when pressing Escape key
- 256 color support
- Vi keybindings in copy mode
- Clean status bar with date/time display
- Visual pane borders with active pane highlighting

## Install

First, make sure to install the following packages using your OS's package manager:

**Required:**
* `tmux`
* `unzip`
* `nvim`
* `zsh`
* `git`
* `sudo`
* `make`
* `wget`

**Optional but recommended for enhanced features:**
* `eza` - modern replacement for ls with icons and colors
* `fzf` - fuzzy finder for history, files, and directories
* `fd` - faster alternative to find (used by fzf)
* `bat` - cat with syntax highlighting (used by fzf for file preview)

### Optional: Go Development

If you want to use the Go development features, you'll need to install Go and related tools.

Devtools **will not** run anything that requires superuser privileges, so these need to be setup first. Make sure `zsh` is your default shell (check your OS documentation), but there's no need to run the first start because the `.zshrc` will be overwritten by devtools.

Instructions are available below for [Ubuntu](#ubuntu) and [Mac OS X](#mac-os-x).

### Ubuntu

Install prereqs first, devtools will not install them for you:

```
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install neovim zsh git make wget unzip tmux

# Optional but recommended
sudo apt-get install eza fzf fd-find bat
```

#### Optional: Kubernetes Development

Install `kubectl` by following https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/.

#### Optional: Go Development

Install Go via command line:
```
# Download and install Go (replace version as needed)
wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc

# Verify installation
go version
```

Install Go development tools:
```
# Install golangci-lint
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.61.0

# gopls will be installed automatically by vim-go on first use
```

Set default shell to `zsh`:

```
chsh -s /bin/zsh
```

Logout and login to use the new shell. Quit the new shell setup that opens when you first start zsh - shell setup will be overwritten by this application.

Proceed to the section on [Running](#running).

### Mac OS X

On OS X Catalina or later, `zsh` will already be installed. If it's not, you should be able to install it with Homebrew (`brew install zsh`).

Install the prereqs first, devtools will not install them for you:

```
brew update && brew upgrade
brew install nvim git make wget tmux

# Optional but recommended
brew install eza fzf fd bat

# After installing fzf, run its install script for key bindings
$(brew --prefix)/opt/fzf/install
```

#### Optional: Kubernetes Development

```
brew install kubectl
```

#### Optional: Go Development

Install Go:
```
brew install go
```

Install Go development tools:
```
# Install golangci-lint
brew install golangci-lint

# Or use the curl method:
# curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.61.0

# gopls will be installed automatically by vim-go on first use
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
    tmux                           Sets up tmux with minimal configuration.
    zsh                            Installs minimal zsh configuration (pure shell, no frameworks).
```

For example, to just setup tmux, run:

```
make tmux
```

## Other

I like to set my terminal theme to the gruvbox theme, the same theme I'm using for `nvim`. For iterm2, download the theme at https://github.com/herrbischoff/iterm2-gruvbox and import it.

Also, I install `screenfetch` when zsh starts up. On Ubuntu, install it as follows:

1. Run `sudo apt-get install screenfetch`.
2. Remove execute permissions from all files in `/etc/update-motd.d` to hide all the other message of the days.
3. Create new file `/etc/update-motd.d/00-header-new` with execute permissions.

Add the following to the new `00-header-new` file:

```
#!/bin/sh

screenfetch
```
