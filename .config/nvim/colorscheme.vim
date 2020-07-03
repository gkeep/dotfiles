function SwitchColorscheme()
    if &background == 'light'
        call DarkTheme()
    elseif &background == 'dark'
        call LightTheme()
    endif

    if exists('g:loaded_lightline')
        call UpdateLightline()
    endif
endfunction

function UpdateLightline()
    source ~/.config/nvim/lightline.vimrc

    call lightline#init()
    call lightline#colorscheme()
endfunction

function LightTheme()
    set background=light
    let g:lightline = { 'colorscheme': 'iceberg' }
endfunction

function DarkTheme()
    set background=dark
    let g:lightline = { 'colorscheme': 'iceberg' }
endfunction
