source $HOME/.config/zsh/history.zsh

# colors for tab-completions
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==02=01}:${(s.:.)LS_COLORS}")'

source $HOME/.aliases

# load starship
eval "$(starship init zsh)"
autoload -U compinit && compinit

# load znap
zstyle ':znap:*' repos-dir ~/.config/zsh/plugins
source $HOME/.config/zsh/plugins/zsh-snap/znap.zsh

# load zsh keybinds
source $HOME/.config/zsh/keybindings.zsh

# todoist completion
source "/usr/share/todoist/todoist_functions.sh"

# source znap plugins
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

zstyle ':autocomplete:*' min-input 7

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

