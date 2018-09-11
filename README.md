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
&& chmod u+x ./makesymlinks.sh ./makevimfancy.sh \ ./makefortunes.sh
&& ./makesymlinks.sh \
&& ./makevimfancy.sh \
&& ./makefortunes.sh \
&& . ~/.bashrc 
```
You may need to exit and restart your shell/terminal if sourcing your ~/.bashrc is not sufficient.
Be sure you update ~/.gitconfig with your information

Uninstall
------------
To roll everything back
``` bash
cd ~/dotfiles \
&& chmod u+x ./uninstall.sh \
&& ./uninstall.sh \
&& . ~/.bashrc
```

Extras
------------
My ~/.bashrc prints a header and fortune when I login. If you'd like a little extra flair you can 
install those using the following or your distributions package manager: 
``` bash 
sudo apt update \
&& sudo apt install fortune \
&& sudo apt install figlet
```
