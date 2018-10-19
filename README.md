# Dotfiles
Cloud storage for my Linux dotfiles so I can sync my bash, vim and other settings across servers.

## Overview
1. Backs up any existing dotfiles in your home directory to `~/dotfiles_old/`
2. Create symlinks in your home directory to the dotfiles in `~/dotfiles/`

#### Installation
``` bash 
git clone https://github.com/seriousfunk/dotfiles ~/dotfiles \
&& chmod u+x ~/dotfiles/install.sh \
&& ~dotfiles/install.sh \
&& . ~/.bashrc 
```

You may need to exit and restart your shell/terminal if sourcing your ~/.bashrc is not sufficient.
Be sure you update ~/.gitconfig with your information

#### Manual Installation
``` bash 
sudo apt update \
&& sudo apt -y install figlet fortune-mod curl
git clone https://github.com/seriousfunk/dotfiles ~/dotfiles \
&& cd ~/dotfiles \
&& chmod u+x ./makesymlinks.sh ./makevimfancy.sh ./makefortunes.sh \
&& ./makesymlinks.sh \
&& ./makevimfancy.sh \
&& sudo ./makefortunes.sh \
&& . ~/.bashrc 
```

#### Uninstall
To roll everything back
``` bash
cd ~/dotfiles \
&& chmod u+x ./uninstall.sh \
&& ./uninstall.sh \
&& . ~/.bashrc
```
