set laststatus=2
set t_Co=256
syntax on
set number
vnoremap <C-c> "*y
"set rnu
set so=5
call plug#begin('~/.vim/plugged')
	Plug 'itchyny/lightline.vim'
	Plug 'mattn/emmet-vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'jiangmiao/auto-pairs'
	Plug 'joshdick/onedark.vim'
	"Plug 'Valloric/YouCompleteMe'
	"Plug 'tjammer/blayu.vim'
call plug#end()
if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
colorscheme onedark
"LightLine settings
let g:lightline = {'colorscheme': 'onedark', 'separator': { 'left': '', 'right': '' }, 'subseparator': { 'left': '', 'right': '' }}
