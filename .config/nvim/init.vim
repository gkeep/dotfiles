set number relativenumber
syntax on
set t_Co=256
set encoding=UTF-8

let mapleader = " "

" convert tab to four spaces
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

call plug#begin('$HOME/.local/share/nvim/site/autoload')
    " lsp
    Plug 'neovim/nvim-lsp'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'

    " git integrations
    Plug 'tpope/vim-fugitive'

    " lightline plugins
    Plug 'itchyny/lightline.vim'

    " fuzzy finding
    Plug 'junegunn/fzf.vim'

    " visuals
    Plug 'cocopon/iceberg.vim'
    Plug 'gkeep/iceberg-dark'

    " syntax highlighting
    Plug 'mboughaba/i3config.vim'
    Plug 'ap/vim-css-color'

    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-commentary'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'machakann/vim-sandwich'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()

colorscheme iceberg
set background=dark

highlight Comment cterm=italic gui=italic

let g:lightline = { 'colorscheme': 'icebergDark' }

" lightline settings
source $HOME/.config/nvim/lightline.vim

" lsp settings
source $HOME/.config/nvim/lsp.vim

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
