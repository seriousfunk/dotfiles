Dotfiles
========

Cloud storage for my Linux dotfiles so I can sync my bash, vim and other settings across servers.

This script and much of the abridged markdown below was taken from:
+ https://github.com/michaeljsmalley/dotfiles
+ http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/


Overview
------------

This repository includes all of my custom dotfiles.  They should be cloned to
your home directory so that the path is `~/dotfiles/`.  The included setup
script creates symlinks from your home directory to the files which are located
in `~/dotfiles/`.

The setup script is smart enough to back up your existing dotfiles into a
`~/dotfiles_old/` directory if you already have any dotfiles of the same name as
the dotfile symlinks being created in your home directory.

So, to recap, the install script will:

1. Back up any existing dotfiles in your home directory to `~/dotfiles_old/`
2. Create symlinks to the dotfiles in `~/dotfiles/` in your home directory

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

Configuration
------------
You can skip some of these steps (i.e. global config settings) if you already have a .gitconfig with your settings.

``` bash
git config --global user.name "Your Name"
git config --global user.email "you@email.com"
git config --global color.ui true
git config --global push.default simple
# remember your password for 15 mins
git config --global credential.helper 'cache --timeout=900'
```

You May Need to
------------

``` bash
cd ~/dotfiles/.git
vi config
# if your [remote "origin"] url is not you@github, fix it.
# it may be incorrect if your server has an older version of git on it and you've cloned https
change:  url = https://github.com/seriousfunk/dotfiles
to this: url = https://seriousfunk@github.com/seriousfunk/dotfiles.git
```

You may need to exit and restart your shell/terminal if sourcing your ~/.bashrc is not sufficient.
