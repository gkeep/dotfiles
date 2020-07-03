set laststatus=2
set t_Co=256
syntax on
vnoremap <C-c> "*y
set number nonumber
set so=5
set encoding=UTF-8

call plug#begin('~/.vim/plugged')
    Plug 'gkeep/iceberg.vim'
    Plug 'gkeep/iceberg-dark'
call plug#end()

colorscheme iceberg
set background=dark

let g:lightline = { 'colorscheme': 'iceberg' }

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
