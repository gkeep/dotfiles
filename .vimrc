set laststatus=2
set t_Co=256
syntax on
set number
vnoremap <C-c> "*y
set nu rnu
set so=5

map <F8> :TagbarToggle<CR>
colorscheme iceberg

if ($TERM == 'st-256color')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"nerdtree settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"LightLine settings
let g:lightline = {'colorscheme': 'iceberg', 'separator': { 'left': '', 'right': '' }, 'subseparator': { 'left': '', 'right': '' }}
