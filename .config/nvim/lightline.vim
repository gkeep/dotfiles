set laststatus=2  " Basic
set noshowmode  " Disable show mode info

let g:lightline.separator            = { 'left': "\ue0b8", 'right': "\ue0be" }
let g:lightline.subseparator         = { 'left': "\ue0b9", 'right': "\ue0b9" }
let g:lightline.tabline_separator    = { 'left': "\ue0bc", 'right': "\ue0ba" }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }

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
