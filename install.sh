#!/bin/bash                                                                                                        
############################                                                                                       
# install.sh                                                                                                  
# This script makes symlinks from the home directory to dotfiles after first backing up your settings in ~/dotfiles_old                       
# Script origin: https://github.com/seriousfunk/dotfiles                                                                                                                     
############################                                                                                       
                                                                                                                   
########## Variables                                                                                               
                                                                                                                   
dir=~/dotfiles                                # dotfiles directory                                                 
olddir=~/dotfiles_old                         # old dotfiles backup directory   

# list of files/folders to symlink in homedir                        
files="bashrc vimrc vim gitconfig gitignore dockerignore"  
                                                                                                                   
##########                                                                                                         
echo
echo -e "\e[0;33m-------------------------------------------------------\e[m"
echo "This script will backup your dotfiles to $olddir and link"
echo "custom dotfiles from https://github.com/seriousfunk/dotfiles."
echo -e "\e[0;33m-------------------------------------------------------\e[m"
echo "Specifically ~/.bashrc ~/.gitconfig ~/.gitignore ~/.vim ~/.vimrc"

# confirm user wants to install custom dotfiles
echo
echo -e "\e[0;33mWould you like to proceed?\e[m [Yn]" 
read installAnswer
ans=${installAnswer:-Y}

# if user answers n or N do not make any changes
if [ n == $ans ] || [ N == $ans ]
then
  echo
  echo -e "\e[0;31mNo changes made.\e[m"
  echo
  exit 0
fi

# if not logged in as root use sudo 
if [[ $EUID -ne 0 ]]; then          
  sudo apt -y install figlet fortune-mod curl
elif                                
  apt -y install figlet fortune-mod curl
fi                                  

cd $dir
chmod u+x ./makesymlinks.sh ./makevimfancy.sh ./makefortunes.sh 
./makesymlinks.sh 
./makevimfancy.sh \
# if not logged in as root use sudo
if [[ $EUID -ne 0 ]]; then
  sudo ./makefortunes.sh 
elif 
  ./makefortunes.sh 
fi

echo
echo -e "\e[0;32mCustom dotfiles created. May the force be with you.\e[m"     
echo
exit 0
