" Tab related 
set tabstop=4           " Each Tab has 1_spaces equivalent width
set shiftwidth=4        " Indentation width when using >> and << re-indentation
set expandtab           " Tabs are expanded to spaces

" Misc
set nobackup
set number

" Teach vim to syntax highlight Vagrantfile as ruby
"
" Install: $HOME/.vim/plugin/vagrant.vim
" Author: Brandon Philips <brandon@ifup.org>
 
augroup vagrant
  au!
  au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

" Get Pathogen going
execute pathogen#infect()
syntax on
filetype plugin indent on
