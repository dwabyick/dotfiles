# Setting up the dotfiles for a new machine.
ln -sf $PWD/aliases ~/.aliases
ln -sf $PWD/bash_profile ~/.bash_profile
ln -sf $PWD/bashrc ~/.bashrc
ln -sf $PWD/git-completion.bash ~/.git-completion.bash
ln -sf $PWD/gitconfig ~/.gitconfig
ln -sf $PWD/gitignore_global ~/.gitignore
ln -sf $PWD/vimrc ~/.vimrc

mkdir -p ~/.vim/colors
cp $PWD/solarized.vim ~/.vim/colors/
