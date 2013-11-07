Dotfiles
========

Cloud storage for my Linux dotfiles so I can sync my bash, vim and other settings across servers.

This script and even the abridged markdown below was taken from:
https://github.com/michaeljsmalley/dotfiles
http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
Thank you.

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

``` bash
git clone https://github.com/seriousfunk/dotfiles ~/dotfiles
cd ~/dotfiles
./makesymlinks.sh
```
