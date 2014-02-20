#! /bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mv $HOME/.vimrc $HOME/.vimrc.`date +"%T"`.bak
ln -nsf $DIR/.vimrc $HOME/.vimrc
vim +BundleInstall +qall
