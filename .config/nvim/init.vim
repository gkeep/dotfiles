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

call plug#begin('~/.vim/plugged')
    " intellisense engine and linting
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'dense-analysis/ale'

    " lightline plugins
	Plug 'itchyny/lightline.vim'
    Plug 'itchyny/vim-gitbranch'
    Plug 'macthecadillac/lightline-gitdiff'
    Plug 'maximbaz/lightline-ale'
    Plug 'albertomontesg/lightline-asyncrun'

    " tmux
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'edkolev/tmuxline.vim'

    " fuzzy finding
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'

    " visuals
    Plug 'yuttie/comfortable-motion.vim'
    Plug 'cocopon/iceberg.vim'
    Plug 'gkeep/iceberg-dark'
    Plug 'ryanoasis/vim-devicons'
    Plug 'mhinz/vim-startify'

    " else
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-obsession'
	Plug 'tpope/vim-commentary'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
  	Plug 'mboughaba/i3config.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ntpeters/vim-better-whitespace'

    Plug 'liuchengxu/vista.vim'
    Plug 'segeljakt/vim-silicon'

    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'

call plug#end()

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set expandtab
set tabstop=4
set shiftwidth=4

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

let s:screen_xs = 30
let s:screen_sm = 60
let s:screen_md = 80
let s:screen_lg = 120
let s:screen_xl = 150

let g:VIM_Linter = 'ale'
let g:Lightline_Linter = [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]

source ~/.config/nvim/lib/lightline.vimrc

let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeGitStatusWithFlags = 1

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

" goyo + limelight
nmap <leader>n :Goyo<cr>
xmap <leader>n :Goyo!<cr>

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" startify settings
let g:startify_lists = [
 \ { 'type': 'files',   'header': ['   Recently used files:'] },
 \ { 'type': 'dir',     'header': ['   Recently used files in this directory:'] }
 \ ]

" MAPPINGS
" vista
map <silent><C-s> :Vista!!<CR>

" comfortable scrolling
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

" fzf
nmap <leader>f :Files<cr>
nmap <leader>/ :BLines<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>r :Rg<cr>
nmap <leader>c :Commands<cr>
