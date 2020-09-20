set laststatus=2  " Basic
set noshowmode  " Disable show mode info

let g:lightline.separator            = { 'left': "", 'right': "" }
let g:lightline.subseparator         = { 'left': "", 'right': "" }
let g:lightline.tabline_separator    = { 'left': "", 'right': "" }
let g:lightline.tabline_subseparator = { 'left': "", 'right': "" }

let g:lightline.active = {
            \ 'left': [ [ 'mode', 'paste' ],
            \           [ 'readonly', 'filename', 'modified'] ],
            \ 'right': [ [ 'filetype', 'lineinfo' ] ]
            \ }
let g:lightline.inactive = {
            \ 'left': [ [ 'filename', 'modified' ]],
            \ 'right': [ [ 'filetype', 'lineinfo' ] ]
            \ }
let g:lightline.tabline = {
            \ 'left': [ [ 'tabs' ] ],
            \ 'right': [ [ 'gitbranch' ],
            \ [ 'gitstatus' ] ]
            \ }
