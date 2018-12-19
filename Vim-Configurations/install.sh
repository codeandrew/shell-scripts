#!/bin/sh
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Finish Cloning vundle"

cp -rfvi .vimrc ~
echo "Finish copying vimrc" 

vim +PluginInstall +qall
echo "Finish Plugin Install in Vim" 

cp -rfvi .vim/plugin .vim/syntax ~/.vim
echo "Finish copying syntax and plugin configs"
