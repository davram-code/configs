#!/bin/bash

# Script for initial deployment of linux

# Installs packages, create configs, etc.


DISTRO=$(hostnamectl status | grep -i "Operating System" | cut -f2 -d: | tail -c+2)

declare -A PKG_MGR
PKG_MGR["Arch Linux"]="pacman"

PACKAGES="i3
          lightdm
          dunst
          yakuake
          vim
          zsh
          git
          nautilus
          
"

AUR_PACKAGES="lightdm-slick-greeter
              
"


#Install packages
sudo pacman -Sy
for i in $PACKAGES
do
    sudo pacman -S $i --noconfirm
done

for i in $AUR_PACKAGES 
do
    sudo pikaur -S $i --noconfirm
done
