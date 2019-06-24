set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" For 'native' commands
source $VIMRUNTIME/mswin.vim
