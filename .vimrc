set laststatus=2
set t_Co=256
syntax on
vnoremap <C-c> "*y
set number nonumber
set so=5
set encoding=UTF-8
set nohlsearch

colorscheme iceberg

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
