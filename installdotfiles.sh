#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles 
# in ~/dotfiles
# Based off makesymlinks.sh from Michael J. Smalley's dotfiles repo
# https://github.com/michaeljsmalley/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
# list of files/folders to symlink in homedir
files="vimrc vim tmux.conf gitignore_global bashrc"    
# list of files/folders to symlink in ~/.config
config_files="sway"
##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# move any existing dotfiles in ~/.config to dotfiles_old directory, then create symlinks
for file in $config_files; do
    echo "Moving any existing dotfiles from ~/.config to $olddir/.config"
    mv ~/.config/$file ~/dotfiles_old/.config/
    echo "Creating symlink to $file in ~/.config directory."
    ln -s $dir/$file ~/.config/$file
done

# Install the global gitignore. This could be cleaner, and will fail silently 
# if git is not already installed
echo "Running git config --global core.excludesfile ~/.gitignore_global"
git config --global core.excludesfile ~/.gitignore_global
