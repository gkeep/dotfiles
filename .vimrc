set laststatus=2
set t_Co=256
syntax on
set number
vnoremap <C-c> "*y
"set rnu
set so=5
execute pathogen#infect()
call plug#begin('~/.vim/plugged')
	Plug 'itchyny/lightline.vim'
	Plug 'mattn/emmet-vim'
	if has('nvim')
  	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	else
  	Plug 'Shougo/deoplete.nvim'
  	Plug 'roxma/nvim-yarp'
  	Plug 'roxma/vim-hug-neovim-rpc'
	endif	
	Plug 'jiangmiao/auto-pairs'
	Plug 'airblade/vim-gitgutter'
	Plug 'junegunn/fzf'
	"Plug 'w0rp/ale'
	Plug 'scrooloose/nerdtree'
	Plug 'joshdick/onedark.vim'
	Plug 'sheerun/vim-polyglot'
	"Plug 'ncm2/ncm2-bufword'
	"Plug 'ncm2/ncm2-path'
	"Plug 'ncm2/ncm2'
	"Plug 'Valloric/YouCompleteMe'
	"Plug 'tjammer/blayu.vim'
call plug#end()
let g:deoplete#enable_at_startup = 1
"autocmd BufEnter * call ncm2#enable_for_buffer()
"set completeopt=noinsert,menuone,noselect
colorscheme iceberg
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
