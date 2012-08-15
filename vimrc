" Daniel Wabyick's vimrc
" Ruthlessly cribbed from: https://github.com/svoisen/dotfiles/blob/master/vimrc

call pathogen#infect()
call pathogen#helptags()

" turn on syntax highlighting and highlight search if the terminal has
" colors
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

colorscheme solarized
set background=dark

