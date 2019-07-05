if g:VIM_Is_In_Tmux == 1
   let g:tmuxline_preset = {
               \'a'    : '#(whoami)',
               \'b'    : '%R %a',
               \'c'    : [ '#{sysstat_mem} #[fg=blue]\ufa51#{upload_speed}' ],
               \'win'  : [ '#I', '#W' ],
               \'cwin' : [ '#I', '#W', '#F' ],
               \'x'    : [ "#[fg=blue]#{download_speed} \uf6d9 #{sysstat_cpu}" ],
               \'y'    : [ '#S'],
               \'z'    : '#H #{prefix_highlight}'
               \}
   let g:tmuxline_separators = {
               \ 'left' : "\ue0bc",
               \ 'left_alt': "\ue0bd",
               \ 'right' : "\ue0ba",
               \ 'right_alt' : "\ue0bd",
               \ 'space' : ' '}
endif
