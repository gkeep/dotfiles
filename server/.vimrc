set laststatus=2
set t_Co=256
syntax on
vnoremap <C-c> "*y
set nu rnu
set so=5
let mapleader = " "

call plug#begin('~/.vim/plugged')
	Plug 'itchyny/lightline.vim'
	Plug 'jiangmiao/auto-pairs'
	Plug 'airblade/vim-gitgutter'
	Plug 'scrooloose/nerdtree'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'w0rp/ale'
call plug#end()

" fzf
nmap <leader>f :Files<cr>
nmap <leader>/ :BLines<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>r :Rg
nmap <leader>c :Commands<cr>

colorscheme iceberg

set termguicolors

"nerdtree settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"LightLine settings
let g:lightline = {'colorscheme': 'iceberg', 'separator': { 'left': '', 'right': '' }, 'subseparator': { 'left': '', 'right': '' }}
