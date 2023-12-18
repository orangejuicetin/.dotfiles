
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Dec 17
"
" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

set hlsearch " highlight your searches
set incsearch " incremental search
set ignorecase " ignore case when searching
set smartcase " no ignorecase if Uppercase char is present
set showmatch " jump to match when searching regex

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages. -----------

syntax on
filetype plugin indent on " detect filetype, load respective plugin and indent file 

set autoindent
set shiftwidth=4 " how much to shift text using > 
set softtabstop=4 "softtabstop smartly inserts spaces/tabs
set expandtab " insert spaces when tab key is pressed

set nobackup " turn off backup file feature with ___~ character
set number " show line numbers
set ruler " show row and column of cursor
