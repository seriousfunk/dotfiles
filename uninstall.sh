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
echo
echo -e "\e[0;33m-------------------------------------------------------\e[m"
echo "This script will remove the custom dotfiles that you "
echo "installed from https://github.com/seriousfunk/dotfiles."
echo -e "\e[0;33m-------------------------------------------------------\e[m"
echo "Specifically ~/.bashrc ~/.gitconfig ~/.gitignore ~/.vim ~/.vimrc"

# confirm user wants to delete custom dotfiles and restore their files webacked up
echo
echo -e "\e[0;33mWould you like to proceed?\e[m [Yn]" 
read uninstallAnswer
ans=${uninstallAnswer:-Y}

# if user answers n or N do not make any changes
if [ n == $ans ] || [ N == $ans ]
then
  echo
  echo -e "\e[0;31mNo changes made.\e[m"
  echo
  exit 0
fi

# remove dotfiles from home directory
echo
echo -n "Removing ~/.bashrc ~/.gitconfig ~/.gitignore ~/.vim ~/.vimrc"        
rm -f ~/.bashrc ~/.gitconfig ~/.gitignore ~/.vim ~/.vimrc 
echo                                                                                                        

# check if user had files we backed up
files=$(shopt -s nullglob dotglob; echo $olddir/*)
if (( ${#files} ))
then
  # change to the dotfiles_old directory where we backed things up                                                                                
  cd $olddir  
  # copying any backed up dotfiles to users home directory
  for file in $files; do                                                                                             
    mv $file $HOME
  done
  echo "Restored your backed up dotfiles to your home directory."
else
  echo "You did not have any dotfiles to restore."
fi

echo
echo -n "Removing $dir and $olddir"
cd ~/
rm -rf $dir $olddir      

echo
echo -e "\e[0;32mCustom dotfiles removed. Everything set back to what it was before.\e[m"     
echo
exit 0
