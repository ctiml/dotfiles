cd ~
ln -s ./work/dotfiles/.bashrc .bashrc
ln -s ./work/dotfiles/.bash_profile .bash_profile
ln -s ./work/dotfiles/.gitconfig .gitconfig
ln -s ./work/dotfiles/.vimrc .vimrc
ln -s ./work/dotfiles/.vim .vim
ln -s ./work/dotfiles/.tmux.conf .tmux.conf
ln -s ./work/dotfiles/.tmux .tmux
ln -s ./work/dotfiles/.screenrc .screenrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
