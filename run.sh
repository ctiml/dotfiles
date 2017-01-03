#!/bin/sh

FILES='.bashrc .bash_profile .gitconfig .vimrc .vim .tmux.conf .tmux .screenrc'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function link() {
  GIT=`which git`
  [[ $GIT =~ ^/([^/]+/)+git$ ]] && echo "git: $GIT" || exit
  VIM=`which vim`
  [[ $VIM =~ ^/([^/]+/)+vim$ ]] && echo "vim: $VIM" || exit

  cd ~
  for f in $FILES
  do
    if [ -e $f ]; then
      [[ ! -e "$DIR/backup" ]] && mkdir "$DIR/backup"
      mv $f "$DIR/backup/"
    fi
    ln -s "$DIR/$f"
  done

  $GIT clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  $VIM +PluginInstall +qall
}

function unlink() {
  cd ~
  for f in $FILES
  do
    [[ -e $f ]] && rm $f
  done
  cp -r "$DIR/backup/." ~
  rm -rf "$DIR/backup"
  rm -rf "$DIR/.vim/bundle"
}

case $1 in
  link)
    link
    ;;
  unlink)
    unlink
    ;;
  *)
    echo "nothing to do"
    ;;
esac
