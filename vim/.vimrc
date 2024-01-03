
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

set backspace=indent,eol,start " make backspace work properly, inserting this precautionarily
highlight LineNr ctermfg=grey
set colorcolumn=80
highlight ColorColumn ctermbg=grey

runtime! ftplugin/man.vim

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
      silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" using vim-plug here: https://github.com/junegunn/vim-plug
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
"
" Make sure you use single quotes
"
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
call plug#end()

let g:seoul256_background = 235
colorscheme seoul256

