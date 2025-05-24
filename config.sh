#! /bin/bash

SCRIPT=$(realpath "$0")
SOURCE_DIR=$(dirname "$SCRIPT")
TARGET_DIR="$HOME"

#DOTFILES=(.zshrc .oh-my-zsh/custom/aliases.zsh .oh-my-zsh/custom/functions.zsh .config/nvim/lua/custom)
DOTFILES=(.zshrc .oh-my-zsh/custom/aliases.zsh .oh-my-zsh/custom/functions.zsh) #nvchad does not support custom folder 

#Remove old dotfiles and replace them
for dotfile in $(echo ${DOTFILES[*]});
do
        TARGET_FILE=$TARGET_DIR/$dotfile
        SOURCE_FILE=$SOURCE_DIR/$dotfile
	
        # Removes old file
        rm -rf $(echo $TARGET_FILE)
        # Creates symlink between source and target file
        ln -s $SOURCE_FILE $TARGET_FILE
        echo "Symbolic link created successfully: $SOURCE_FILE-> $TARGET_FILE"
done
