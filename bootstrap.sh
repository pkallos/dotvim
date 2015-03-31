#! /bin/bash
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR
mv $HOME/.vimrc $HOME/.vimrc.`date +"%T"`.bak

mkdir -p ~/.vim/swaps
mkdir -p ~/.vim/undo

ln -nsf $DIR/.vimrc $HOME/.vimrc
vim +BundleInstall +qall
