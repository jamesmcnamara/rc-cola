#!/usr/bin/env fish

function letsgo
    git submodule init
    git submodule update
end

letsgo
cd dot-vim
git checkout vundle
letsgo

..
ln -s $PWD/dot-vim $HOME/.vim 
ln -s $PWD/dot-vim/.vimrc $HOME/.vimrc

mkdir -p ~/.config/fish
ln -s $PWD/config.fish $HOME/.config/fish/

ln -s $PWD/gitconfig $HOME/.gitconfig
