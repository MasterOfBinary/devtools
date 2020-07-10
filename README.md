# devtools

Prereq: install vim, zsh, git, sudo, make, wget update all packages (e.g. apt-get update). Setup git email and username and ssh creds for github. Make sure zsh is current shell.

On ubuntu:

Install prereqs:

sudo apt-get update && sudo apt-get upgrade
sudo apt-get install vim zsh git make wget

ssh-keygen -t rsa -b 4096 -C "youremail@youremail.com"
Follow instructions.

cat ~/.ssh/id_rsa.pub

Copy and paste to github.

git clone git@github.com:MasterOfBinary/devtools.git
Yes, continue connecting.

Set default shell:

chsh -s /bin/zsh

Logout and login.
Quit the new shell setup - shell setup will be overwritten by this application.

cd devtools
make
