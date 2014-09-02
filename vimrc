" Daniel Wabyick's vimrc
" Ruthlessly cribbed from: https://github.com/svoisen/dotfiles/blob/master/vimrc

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
