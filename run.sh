#!/bin/bash

#Variables
dir=~/dotfiles
backup_dir=~/dotfiles_old
files="bash_aliases bashrc"

echo "Waiting..."
###
#Creating Backup dir
mkdir -p $backup_dir

###
#Creating Symlinks && Backing up old dot files
cd $dir
for file in $files; do
	mv ~/.$file ~/dotfiles_old/
	ln -s $dir/$file ~/.$file
done

echo "...done!"
