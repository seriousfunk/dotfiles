#!/bin/bash
############################
# makesfancy.sh
# This script add vim-pathogen pkg mgr and vim colorschemes
# Script origin: https://github.com/seriousfunk/dotfiles/
############################

# add vim-pathogen package manager
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# add vim colorschemes 
cd ~/.vim/bundle && \
git submodule add https://github.com/rafi/awesome-vim-colorschemes
