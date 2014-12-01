" Daniel Wabyick's vimrc

" Load vundle - our vim bundle manager
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Install our Vundle plugins

" Airline configuration
Plugin 'bling/vim-airline'
:let g:airline_theme='tomorrow'

" Support for multiple lines
set hidden
" Better command-line completion
set wildmenu
" Show partial commands in the last line of the screen
set showcmd

" Always display the status line, even if only one window is displayed
set laststatus=2

" Indentation settings for using 2 spaces instead of tabs.
" " Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" turn on syntax highlighting and highlight search if the terminal has
" colors
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif


set background=dark
colorscheme solarized


" file encoding options
if has("multi_byte")
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "set termencoding=iso-8859-1
endif

" turn on file type support
filetype on

" turn on filetype specific indenting
filetype plugin indent on

" change completion menu to always appear even with one result
set completeopt=longest,menuone


set number

" auto-load changes to .vimrc
 if has("autocmd")
   autocmd bufwritepost .vimrc source $MYVIMRC
   endif

" enable the mouse
set mouse=a
