#!/bin/bash                                                                                        
                                                                                                   
myFortunesDir=~/dotfiles/fortunes                                                                  
fortunesDir=/usr/share/games/fortunes                                                              
                                                                                                   
echo ""                                                                                            
echo -e "\e[0;96mCreating symlink of files in $myFortunesDir to $fortunesDir.\e[m"                 
echo ""                                                                                            
                                                                                                   
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
