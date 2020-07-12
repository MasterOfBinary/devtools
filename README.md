# Devtools

Devtools contains a makefile and a set of scripts for setting up my common dev tools (like `nvim` and `zsh`) in a newly installed Linux system
so I have a consistent development environment every time.

## About

I put together this repo because I always have trouble setting up new development environments, which I find myself doing quite often for
testing or just to check out a new Linux distro. This set of scripts can be run to give me the exact same environment every time.

Feel free to take it and modify it for your own use-case, but I would highly recommend not to use it as-is because it's specific to my own
workflow and it's better to customize your own environment.

I've used devtools on Ubuntu and ArchLinux, and will likely do so in Mac OS X in the future. It may work for other Linux distros as well,
but I haven't tested it and have no plans to do so.

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

Devtools **will not** run anything that requires superuser privileges, so these need to be setup first. Make sure `zsh` is your default shell (check your OS documentation), but
there's no need to run the first start because the zshrc will be overwritten by devtools.

Instructions are available below for [Ubuntu](#ubuntu).

### Ubuntu

Install prereqs first, devtools will not install them for you:

```
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install nvim zsh git make wget
```

Generate keys by running these commands and following the instructions:

```
ssh-keygen -t rsa -b 4096 -C "youremail@youremail.com"
cat ~/.ssh/id_rsa.pub
```

Copy and paste the output of `cat` to github. Now we can clone the devtools repo:

```
git clone git@github.com:MasterOfBinary/devtools.git
```

Set default shell:

```
chsh -s /bin/zsh
```

Logout and login. Quit the new shell setup that opens when you first start zsh - shell setup will be overwritten by this application.

Go to the devtools directory and run make to install everything, or `make help` to see which components can be installed.

```
cd devtools
make
```
