# Devtools

<<<<<<< HEAD
Devtools contains a makefile and a set of scripts for setting up my common dev tools (like `nvim` and `zsh`) in a newly installed Linux system
so I have a consistent development environment every time.
=======
Devtools contains a makefile and a set of scripts for setting up my common dev tools (like `vim` and `zsh`) in a newly installed Linux system so I have a consistent development environment every time.
>>>>>>> 84004a4434dfeedc8efa749be6d667c1421465cd

## About

I put together this repo because I always have trouble setting up new development environments, which I find myself doing quite often for testing or just to check out a new Linux distro. This set of scripts can be run to give me the exact same environment every time.

Feel free to take it and modify it for your own use-case, but I would highly recommend not to use it as-is because it's specific to my own workflow and it's better to customize your own environment.

I've used devtools on Ubuntu and ArchLinux, and will likely do so in Mac OS X in the future. It may work for other Linux distros as well, but I haven't tested it and have no plans to do so.

Currently the following tools are setup:

* `zsh` with `oh-my-zsh` and the `powerline10k` theme.
* `nvim` with `gruvbox` theme and support for Golang.
* `screen` with some basic changes to its look.

I will probably add more in the future, like Go or Docker.

## Install

First, make sure to install the following packages using your OS's package manager:

* `screen`
* `unzip`
* `nvim`
* `zsh`
* `git`
* `sudo`
* `make`
* `wget`

Devtools **will not** run anything that requires superuser privileges, so these need to be setup first. Make sure `zsh` is your default shell (check your OS documentation), but there's no need to run the first start because the `.zshrc` will be overwritten by devtools.

Instructions are available below for [Ubuntu](#ubuntu) and [Mac OS X](#mac-os-x).

### Ubuntu

Install prereqs first, devtools will not install them for you:

```
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install nvim zsh git make wget unzip screen
```

Set default shell to `zsh`:

```
chsh -s /bin/zsh
```

Logout and login to use the new shell. Quit the new shell setup that opens when you first start zsh - shell setup will be overwritten by this application.

Proceed to the section on [Running](#running).

### Mac OS X

On OS X Catalina, `zsh` will already be installed. If it's not, you should be able to install it with Homebrew (`brew install zsh`).

Install the prereqs first, devtools will not install them for you:

```
brew update && brew upgrade
brew install vim git make wget screen
```

Set default shell to `zsh`:

```
chsh -s /bin/zsh
```

Logout and login to use the new shell. Quit the new shell setup that opens when you first start zsh - shell setup will be overwritten by this application.

Proceed to the section on [Running](#running).

## Running

For now, the repo is private, so generate keys by running these commands and following the instructions:

```
ssh-keygen -t rsa -b 4096 -C "youremail@youremail.com"
cat ~/.ssh/id_rsa.pub
```

Copy and paste the output of `cat` to github.

Clone the devtools repo:

```
git clone git@github.com:MasterOfBinary/devtools.git
```

Devtools needs to be run from its directory (i.e. the directory with the `Makefile`):

```
cd devtools
```

Use `make` to install everything. No superuser privileges are required:

```
make
```

You can use `make help` to get a list of `make` targets:

```
Usage:
    make <target>

Targets:
    help                           Shows help.
    screen                         Sets up screen.
    vim                            Sets up vim with plugins and config files.
    zsh                            Installs oh-my-zsh with powerline10k theme and config files.
```

For example, to just setup screen, run:

```
make screen
```
