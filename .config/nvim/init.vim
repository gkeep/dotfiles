set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
let mapleader = " "
set mouse=a

if executable('tmux') && filereadable(expand('~/.zshrc')) && $TMUX !=# ''
    let g:VIM_Is_In_Tmux = 1
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
else
    let g:VIM_Is_In_Tmux = 0
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

call plug#begin('~/.vim/plugged')

    " linting and completion
    Plug 'dense-analysis/ale'

    " git integrations
    Plug 'macthecadillac/lightline-gitdiff'
    Plug 'tpope/vim-fugitive'

    " lightline plugins
    Plug 'itchyny/lightline.vim'
    Plug 'maximbaz/lightline-ale'
    Plug 'albertomontesg/lightline-asyncrun'

    " fuzzy finding
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'

    " visuals
    Plug 'cocopon/iceberg.vim'
    Plug 'gkeep/iceberg-dark'

    Plug 'yuttie/comfortable-motion.vim'
    Plug 'mhinz/vim-startify'

    " else
    Plug 'machakann/vim-sandwich'
  	Plug 'mboughaba/i3config.vim'
    Plug 'jiangmiao/auto-pairs'

call plug#end()

colorscheme iceberg
set background=dark

if &background == 'light'
    let g:lightline = { 'colorscheme': 'iceberg' }
else
    let g:lightline = { 'colorscheme': 'icebergDark' }
endif

" lightline settings
let g:VIM_Linter = 'ale'
let g:Lightline_Linter = [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]

source ~/.config/nvim/lightline.vimrc

set expandtab
set tabstop=4
set shiftwidth=4

highlight Comment cterm=italic gui=italic

let s:screen_xs = 30
let s:screen_sm = 60
let s:screen_md = 80
let s:screen_lg = 120
let s:screen_xl = 150

" vista settings
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
\   'go': 'ctags',
\   'python': 'coc',
\   }
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

" startify settings
let g:startify_lists = [
 \ { 'type': 'files',   'header': ['   Recently used files:'] },
 \ { 'type': 'dir',     'header': ['   Recently used files in this directory:'] }
 \ ]

" comfortable scrolling
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

" fzf
nmap <leader>f :Files<cr>
nmap <leader>/ :BLines<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>r :Rg<cr>
nmap <leader>c :Commands<cr>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
