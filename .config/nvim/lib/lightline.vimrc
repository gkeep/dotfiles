function! ObsessionStatusEnhance() abort
    if ObsessionStatus() ==# '[$]'
        " return \uf94a
        return '⏺'
    else
        " return \uf949
        return '⏹'
    endif
endfunction
function! Devicons_Filetype()"
    " return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : 'no ft') : ''
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction"
function! Devicons_Fileformat()"
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction"
function! Artify_active_tab_num(n) abort"
    return Artify(a:n, 'bold')." \ue0bb"
endfunction"
function! Artify_inactive_tab_num(n) abort"
    return Artify(a:n, 'double_struck')." \ue0bb"
endfunction"
function! Artify_lightline_tab_filename(s) abort"
    return Artify(lightline#tab#filename(a:s), 'monospace')
endfunction"
function! Artify_lightline_mode() abort"
    return Artify(lightline#mode(), 'monospace')
endfunction"
function! Artify_line_percent() abort"
    return Artify(string((100*line('.'))/line('$')), 'bold')
endfunction"
function! Artify_line_num() abort"
    return Artify(string(line('.')), 'bold')
endfunction"
function! Artify_col_num() abort"
    return Artify(string(getcurpos()[2]), 'bold')
endfunction"
function! Artify_gitbranch() abort"
    if gitbranch#name() !=# ''
        return Artify(gitbranch#name(), 'monospace')." \ue725"
    else
        return "\ue61b"
    endif
endfunction"
"
set laststatus=2  " Basic
set noshowmode  " Disable show mode info
augroup Lightline_Au
    autocmd!
    autocmd BufWritePost * call lightline_gitdiff#query_git() | call lightline#update()
augroup END
let g:lightline = { 'colorscheme': 'iceberg' }
let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
let g:lightline#neomake#prefix_infos = 'ℹ'
let g:lightline#neomake#prefix_warnings = "\uf529"
let g:lightline#neomake#prefix_errors = "\uf00d"
let g:lightline#neomake#prefix_ok = "\uf00c"
let g:lightline_neomake#format = '%s: %d'
let g:lightline_neomake#sep = "\ue0b9"
let g:lightline#lsc#indicator_checking = "\uf110"
let g:lightline#lsc#indicator_notstarted = "\ufbab"
let g:lightline#lsc#indicator_errors = "\uf00d"
let g:lightline#lsc#indicator_ok = "\uf00c"
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf529"
let g:lightline#ale#indicator_errors = "\uf00d"
let g:lightline#ale#indicator_ok = "\uf00c"
let g:lightline_gitdiff#indicator_added = '+'
let g:lightline_gitdiff#indicator_deleted = '-'
let g:lightline_gitdiff#indicator_modified = '*'
let g:lightline_gitdiff#min_winwidth = '70'
if g:VIM_Linter ==# 'ale'
    let g:Lightline_Linter = [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]
elseif g:VIM_Linter ==# 'neomake'
    let g:Lightline_Linter = [ 'neomake_warnings', 'neomake_errors', 'neomake_infos', 'neomake_ok', 'lsc_ok', 'lsc_errors', 'lsc_checking', 'lsc_warnings' ]
endif
let g:lightline.active = {
            \ 'left': [ [ 'mode', 'paste' ],
            \           [ 'readonly', 'filename', 'modified', 'fileformat', 'devicons_filetype' ] ],
            \ 'right': [ [ 'lineinfo' ],
            \            g:Lightline_Linter,
            \           [ 'asyncrun_status' ] ]
            \ }
let g:lightline.inactive = {
            \ 'left': [ [ 'filename' , 'modified', 'fileformat', 'devicons_filetype' ]],
            \ 'right': [ [ 'artify_lineinfo' ] ]
            \ }
let g:lightline.tabline = {
            \ 'left': [ [ 'vim_logo', 'tabs' ] ],
            \ 'right': [ [ 'artify_gitbranch' ],
            \ [ 'gitstatus' ] ]
            \ }
let g:lightline.tab = {
            \ 'active': [ 'artify_activetabnum', 'artify_filename', 'modified' ],
            \ 'inactive': [ 'artify_inactivetabnum', 'filename', 'modified' ] }
let g:lightline.tab_component = {
            \ }
let g:lightline.tab_component_function = {
            \ 'artify_activetabnum': 'Artify_active_tab_num',
            \ 'artify_inactivetabnum': 'Artify_inactive_tab_num',
            \ 'artify_filename': 'Artify_lightline_tab_filename',
            \ 'filename': 'lightline#tab#filename',
            \ 'modified': 'lightline#tab#modified',
            \ 'readonly': 'lightline#tab#readonly',
            \ 'tabnum': 'lightline#tab#tabnum'
            \ }
let g:lightline.component = {
            \ 'artify_gitbranch' : '%{Artify_gitbranch()}',
            \ 'gitstatus' : '%{lightline_gitdiff#get_status()}',
            \ 'bufinfo': '%{bufname("%")}:%{bufnr("%")}',
            \ 'obsession': '%{ObsessionStatusEnhance()}',
            \ 'vim_logo': "\ue7c5",
            \ 'nicewinnumber': '%{NegativeCircledNumber(tabpagewinnr(tabpagenr()))}',
            \ 'mode': '%{lightline#mode()}',
            \ 'artify_mode': '%{Artify_lightline_mode()}',
            \ 'absolutepath': '%F',
            \ 'relativepath': '%f',
            \ 'filename': '%t',
            \ 'filesize': "%{HumanSize(line2byte('$') + len(getline('$')))}",
            \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
            \ 'fileformat': '%{&fenc!=#""?&fenc:&enc}[%{&ff}]',
            \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
            \ 'modified': '%M',
            \ 'bufnum': '%n',
            \ 'paste': '%{&paste?"PASTE":""}',
            \ 'readonly': '%R',
            \ 'charvalue': '%b',
            \ 'charvaluehex': '%B',
            \ 'percent': '%2p%%',
            \ 'percentwin': '%P',
            \ 'spell': '%{&spell?&spelllang:""}',
            \ 'lineinfo': '%2p%% %3l:%-2v',
            \ 'artify_lineinfo': "%2{Artify_line_percent()}\uf295 %3{Artify_line_num()}:%-2{Artify_col_num()}",
            \ 'line': '%l',
            \ 'column': '%c',
            \ 'close': '%999X X ',
            \ 'winnr': '%{winnr()}'
            \ }
let g:lightline.component_function = {
            \ 'gitbranch': 'gitbranch#name',
            \ 'devicons_filetype': 'Devicons_Filetype',
            \ 'devicons_fileformat': 'Devicons_Fileformat'
            \ }
let g:lightline.component_expand = {
            \ 'neomake_infos': 'lightline#neomake#infos',
            \ 'neomake_warnings': 'lightline#neomake#warnings',
            \ 'neomake_errors': 'lightline#neomke#errors',
            \ 'neomake_ok': 'lightline#neomake#ok',
            \ 'lsc_checking': 'lightline#lsc#checking',
            \ 'lsc_warnings': 'lightline#lsc#warnings',
            \ 'lsc_errors': 'lightline#lsc#errors',
            \ 'lsc_ok': 'lightline#lsc#ok',
            \ 'linter_checking': 'lightline#ale#checking',
            \ 'linter_warnings': 'lightline#ale#warnings',
            \ 'linter_errors': 'lightline#ale#errors',
            \ 'linter_ok': 'lightline#ale#ok',
            \ 'asyncrun_status': 'lightline#asyncrun#status'
            \ }
let g:lightline.component_type = {
            \ 'neomake_warnings': 'warning',
            \ 'neomake_errors': 'error',
            \ 'neomake_ok': 'middle',
            \ 'lsc_checking': 'middle',
            \ 'lsc_warnings': 'warning',
            \ 'lsc_errors': 'error',
            \ 'lsc_ok': 'middle',
            \ 'linter_checking': 'middle',
            \ 'linter_warnings': 'warning',
            \ 'linter_errors': 'error',
            \ 'linter_ok': 'middle'
            \ }
let g:lightline.component_visible_condition = {
            \     'gitstatus': 'lightline_gitdiff#get_status() !=# ""'
            \ }
