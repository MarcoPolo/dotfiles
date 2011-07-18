#!/bin/bash

for ARG in $*
do
	echo "Backing up old $ARG"
	mv $HOME/$ARG $HOME/bak/
	echo "creating symbolic link"
	ln -s $HOME/dotfiles/$ARG $HOME/$ARG
done
