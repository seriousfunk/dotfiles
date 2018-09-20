#!/bin/bash                                                                                                        
############################                                                                                       
# makefortunes.sh                                                                                                  
# Creates symlinks to /usr/share/games/fortunes for our custome fortune files
# Script origin: https://github.com/seriousfunk/dotfiles                                                                                                                     
############################            

myFortunesDir=~/dotfiles/fortunes
fortunesDir=/usr/share/games/fortunes
                                                                                                   
# make sure fortune is installed                                                                 
if [ -x /usr/games/fortune ]                                                                     
then                                                                                             
  echo "";                                                                                       
  echo -e "\e[0;96mCreating symlink of files in $myFortunesDir to $fortunesDir.\e[m";            
  echo "";                                                                                       
else                                                                                             
    echo "";                                                                                     
    echo -e "\e[0;31mYou must install fortune first. (e.g. sudo apt install fortune-mod)\e[m"; 
    echo "";                                                                                     
    exit 1;                                                                                      
fi                                                                                               

# create system fortune directory if it does not already exist
if [ ! -d $fortunesDir ]
then
  sudo mkdir $fortunesDir  
fi

for filename in $myFortunesDir/*; do                                                             
  if [ -e $fortunesDir/${filename##*/} ]                                                         
  then                                                                                           
    echo -e "\e[0;31m-> $fortunesDir/${filename##*/} already exists. Not creating symlink.\e[m"  
  else                                                                                           
    ln -s $filename $fortunesDir/${filename##*/}                                                 
    echo -e "\e[0;33m-> created symlink for $filename\e[m"                                       
  fi                                                                                             
done                                                                                             
                                                                                                 
echo ""                                                                                                                                                                                   
