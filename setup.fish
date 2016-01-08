#!/usr/bin/env fish

mkdir .vim 
ln -s $PWD/dot-vim/.vimrc $HOME/.vimrc

mkdir -p ~/.config/fish
ln -s $PWD/config.fish $HOME/.config/fish/

ln -s $PWD/gitconfig $HOME/.gitconfig
