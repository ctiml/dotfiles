cd ~
ln -s ./work/dotfiles/.bashrc .bashrc
ln -s ./work/dotfiles/.bash_profile .bash_profile
ln -s ./work/dotfiles/.gitconfig .gitconfig
ln -s ./work/dotfiles/.vimrc .vimrc
ln -s ./work/dotfiles/.vim .vim
ln -s ./work/dotfiles/.tmux.conf .tmux.conf
ln -s ./work/dotfiles/.tmux .tmux

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
