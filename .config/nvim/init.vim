set number relativenumber
syntax on
set t_Co=256
set encoding=UTF-8

let mapleader = " "

" tab is four spaces
set expandtab
set tabstop=4
set shiftwidth=4

set mouse=a

" use truecolor
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

call plug#begin('~/.local/share/nvim/site/autoload')
    " completion
    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    " git integrations
    Plug 'tpope/vim-fugitive'

    " lightline plugins
    Plug 'itchyny/lightline.vim'

    " fuzzy finding
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " visuals
    Plug 'cocopon/iceberg.vim'
    Plug 'gkeep/iceberg-dark'

    " syntax highlighting
    Plug 'mboughaba/i3config.vim'
    Plug 'ap/vim-css-color'

    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-commentary'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'machakann/vim-sandwich'
call plug#end()

colorscheme iceberg
set background=dark

highlight Comment cterm=italic gui=italic

if &background == 'light'
    let g:lightline = { 'colorscheme': 'iceberg' }
else
    let g:lightline = { 'colorscheme': 'icebergDark' }
endif

" colorscheme switching funcitons
source ~/.config/nvim/colorscheme.vim

" lightline settings
source ~/.config/nvim/lightline.vim

" deoplete settings
" let g:deoplete#enable_at_startup = 1

let s:screen_xs = 30
let s:screen_sm = 60
let s:screen_md = 80
let s:screen_lg = 120
let s:screen_xl = 150

" fzf
nmap <leader>f :Files<cr>
nmap <leader>/ :BLines<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>r :Rg<cr>
nmap <leader>c :Commands<cr>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
