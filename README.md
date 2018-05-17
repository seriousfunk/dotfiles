Dotfiles
========

Cloud storage for my Linux dotfiles so I can sync my bash, vim and other settings across servers.

This script was based on https://github.com/michaeljsmalley/dotfiles

Overview
------------
1. Backs up any existing dotfiles in your home directory to `~/dotfiles_old/`
2. Create symlinks in your home directory to the dotfiles in `~/dotfiles/`

Installation
------------
Cut and paste into your linux terminal the 6 lines below to install and link these dotfiles :)
``` bash
git clone https://github.com/seriousfunk/dotfiles ~/dotfiles \
&& cd ~/dotfiles \
&& chmod u+x ./makesymlinks.sh ./makevimfancy.sh \
&& ./makesymlinks.sh \
&& ./makevimfancy.sh \
&& . ~/.bashrc 
```
You may need to exit and restart your shell/terminal if sourcing your ~/.bashrc is not sufficient.

Extras
------------
My ~/.bashrc prints a header and fortune when I login. If you'd like a little extra flair you can 
install those using: 
``` bash 
sudo apt-get install fortune && sudo apt-get install figlet
```
