#!/usr/bin/env fish

function getext
    switch (uname)
    case Darwin
        echo '.mac'
    case '*' 
        echo '.linux'
    end
end


function letsgo
    git submodule init
    git submodule update
end

letsgo
cd dot-vim
letsgo

..
ln -s $PWD/dot-vim $HOME/.vim 
ln -s $PWD/dot-vim/.vimrc $HOME/.vimrc

mkdir -p ~/.config/fish
ln -s $PWD/config.fish $HOME/.config/fish/

ln -s $PWD/gitconfig(getext) $HOME/.gitconfig
ln -s $PWD/fish-functions $HOME/.config/fish/functions

vim +PluginInstall +qall
