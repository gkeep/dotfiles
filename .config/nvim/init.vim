set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
let mapleader = " "

if executable('tmux') && filereadable(expand('~/.zshrc')) && $TMUX !=# ''
    let g:VIM_Is_In_Tmux = 1
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
else
    let g:VIM_Is_In_Tmux = 0
endif

call plug#begin('~/.vim/plugged')
    " intellisense engline and linting
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
	Plug 'w0rp/ale'

    " lightline plugins
	Plug 'itchyny/lightline.vim'
    Plug 'itchyny/vim-gitbranch'
    Plug 'macthecadillac/lightline-gitdiff'
    Plug 'maximbaz/lightline-ale'
    Plug 'sinetoami/lightline-neomake'
    Plug 'Palpatineli/lightline-lsc-nvim'
	Plug 'sainnhe/artify.vim'
    Plug 'albertomontesg/lightline-asyncrun'

    " tmux
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'sainnhe/tmuxline.vim'
    
    " nerdtree
    Plug 'scrooloose/nerdtree'
	Plug 'tsony-tsonev/nerdtree-git-plugin'
	Plug 'ryanoasis/vim-devicons'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	
    " fuzzy finding
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	
    " visuals
    Plug 'yuttie/comfortable-motion.vim'
    Plug 'cocopon/iceberg.vim'
    
    " else
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-obsession'
	Plug 'tpope/vim-commentary'
	Plug 'miyakogi/livemark.vim'
  	Plug 'mboughaba/i3config.vim'
    Plug 'jiangmiao/auto-pairs'

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
if g:VIM_Linter ==# 'ale'
    Plug 'w0rp/ale'
    Plug 'maximbaz/lightline-ale'
elseif g:VIM_Linter ==# 'neomake'
    Plug 'neomake/neomake'
    Plug 'sinetoami/lightline-neomake'
    if g:VIM_LSP_Client ==# 'lcn'
        Plug 'Palpatineli/lightline-lsc-nvim'
    endif
endif

if g:VIM_Linter ==# 'ale'
    let g:Lightline_Linter = [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]
elseif g:VIM_Linter ==# 'neomake'
    let g:Lightline_Linter = [ 'neomake_warnings', 'neomake_errors', 'neomake_infos', 'neomake_ok', 'lsc_ok', 'lsc_errors', 'lsc_checking', 'lsc_warnings' ]
endif

aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

source ~/.config/nvim/lib/lightline.vimrc
"source ~/.config/nvim/lib/tmuxline.vimrc

let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

let g:NERDTreeGitStatusNodeColorization = 1                                                         
let g:NERDTreeGitStatusWithFlags = 1

" nvim-gtk settings
if exists('g:GtkGuiLoaded')
	call rpcnotify(1, 'Gui', 'Font', 'FuraCode Nerd Font 10'),
	let NVIM_GTK_NO_HEADERBAR = 1
	let g:GuiInternalClipboard = 1
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" fzf
nmap <leader>f :Files<cr>
nmap <leader>/ :BLines<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>r :Rg  
nmap <leader>c :Commands<cr>
