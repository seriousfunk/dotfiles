#!/bin/bash                                                                                                        
############################                                                                                       
# uninstall.sh                                                                                                  
# This script removes symlinks from the home directory to dotfiles and sets back your settings backed up in ~/dotfiles_old                       
# Script origin: https://github.com/seriousfunk/dotfiles                                                                                                                     
############################                                                                                       
                                                                                                                   
########## Variables                                                                                               
                                                                                                                   
dir=~/dotfiles                                # dotfiles directory                                                 
olddir=~/dotfiles_old                         # old dotfiles backup directory                                      
files="bashrc vimrc vim gitconfig gitignore"  # list of files/folders to symlink in homedir                        
                                                                                                                   
##########                                                                                                         
echo -e "\e[0;33m------------------------------------------------\e[m"
echo "This script will delete the softlinks in your home directory to the"
echo "dotfiles you installed from https://github.com/seriousfunk/dotfiles.
echo -e "\e[0;33m------------------------------------------------\e[m"
echo
echo "Specifically ~/.bashrc ~/.gitconfig ~/.gitignore ~/.vim ~/.vimrc"
echo 
echo "This script will restore any original files backed up to dotfiles_old.
echo 
echo "\e[0;33mWould you like to proceed?\e[m"

# confirm user wants to delete custom dotfiles and restore their files webacked up
read -p "\e[0;33mWould you like to proceed?\e[m [Yn]" uninstallAnswer
ans=${uninstallAnswer:-Y}

# if user answers n or N do not make any changes
if [ n == $ans ] || [ N == $ans ]
then
  echo -e "No changes made."
  exit 0
fi

# remove dotfiles from home directory
echo -n "Removing ~/.bashrc ~/.gitconfig ~/.gitignore ~/.vim ~/.vimrc"        
rm -f ~/.bashrc ~/.gitconfig ~/.gitignore ~/.vim ~/.vimrc 
                                                                                                           
# check if user had files we backed up
files=$(shopt -s nullglob dotglob; echo $olddir/*)
if (( ${#files} ))
then
  # change to the dotfiles_old directory where we backed things up                                                                                
  echo -n "Changing to the $olddir directory ..."                                                                       
  cd $olddir  
  # copying any backed up dotfiles to users home directory
  for file in $files; do                                                                                             
    echo "Copying any backed up dotfiles from $olddir to ~"                                                          
    cp $olddir/.$file ~                                                                                           
  done
  echo -n "Restored your backed up dotfiles to your home directory."
else 
  echo -n "You did not have any dotfiles to back up so there is nothing to restore."
fi

echo -n "Removing $dir and $olddir"
rm -f $dir $olddir      

echo -n "Custom dotfiles removed. Everything set back to what it was before."     
echo -n "done.                                                                                                        

