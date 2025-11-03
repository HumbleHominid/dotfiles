#!/usr/bin/env zsh

# Set DOTFILES environment variable to the current directory
export DOTFILES=$(pwd)

# Create symlink for .vimrc
if [ ! -f ~/.vimrc ]; then
    ln -s $DOTFILES/.vimrc ~/.vimrc

    printf "Created symlink for .vimrc"
    printf "\n"
fi

# Create .zshrc if it does not exist
if [ ! -f ~/.zshrc ]; then
    printf "" > ~/.zshrc

    printf "Created empty .zshrc"
    printf "\n"
fi
# Append an include to the end of ~/.zshrc to source this .zshrc
if ! grep -q "# HumbleHominid" ~/.zshrc; then
    printf "\n" >> ~/.zshrc
    printf "# HumbleHominid\n" >> ~/.zshrc
    printf "export DOTFILES=\"%s\"\n" "$DOTFILES" >> ~/.zshrc
    printf "source $DOTFILES/.zshrc\n" >> ~/.zshrc
    printf "# HumbleHominid end\n" >> ~/.zshrc

    printf "Appended source line to .zshrc"
    printf "\n"
fi


