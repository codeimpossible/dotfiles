#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && cd .. && pwd )"

rm -rf ~/.local/bin
ln -s $DIR/local/bin ~/.local/bin

if [[ -d ~/.oh-my-zsh ]]; then
    rm -rf ~/.oh-my-zsh
fi


rm -rf ~/.bashrc
rm -rf ~/.gemrc
rm -rf ~/.gitconfig
rm -rf ~/.tmux.conf
rm -rf ~/.vim
rm -rf ~/.vimrc
rm -rf ~/.zshrc

ln -s $DIR/.bashrc ~/.bashrc
ln -s $DIR/.gemrc ~/.gemrc
ln -s $DIR/.gitconfig ~/.gitconfig
ln -s $DIR/.tmux.conf ~/.tmux.conf
ln -s $DIR/.vim ~/.vim
ln -s $DIR/.vimrc ~/.vimrc
ln -s $DIR/zsh/.zshrc ~/.zshrc


# useful tools
gem install braid


if [[ -d $DIR/zsh/.oh-my-zsh ]]; then
    pushd $DIR/zsh/.oh-my-zsh
    git reset --hard HEAD && git pull origin master
    popd
else
    git clone https://github.com/robbyrussell/oh-my-zsh.git $DIR/zsh/.oh-my-zsh
fi
ln -s $DIR/zsh/.oh-my-zsh ~/.oh-my-zsh
