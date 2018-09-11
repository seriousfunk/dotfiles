#!/bin/bash
############################
# makevimfancy.sh
# This script add vim-pathogen pkg mgr and vim colorschemes
# Script origin: https://github.com/seriousfunk/dotfiles/
############################

# add vim-pathogen package manager
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# add vim colorschemes 
cd ~/.vim/bundle && \
git clone https://github.com/rafi/awesome-vim-colorschemes
git clone https://github.com/vim-airline/vim-airline

# return user to home directory
cd ~/

