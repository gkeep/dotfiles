source ~/.config/zsh/plugins/zsh-snap/znap.zsh
source $HOME/.config/zsh/history.zsh

export WORDCHARS='~!#$%^&*(){}[]<>?.+;-'
export MOTION_WORDCHARS='~!#$%^&*(){}[]<>?.+;-/'

# colors for tab-completions
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==02=01}:${(s.:.)LS_COLORS}")'

source $HOME/.aliases

# load starship
source $HOME/.config/zsh/prompt.zsh

if [ -f $HOME/.profile ]; then
    . $HOME/.profile
fi

# load zsh keybinds
source $HOME/.config/zsh/keybindings.zsh

# todoist completion
# source "/usr/share/todoist/todoist_functions.sh"

# source znap plugins
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

zstyle ':autocomplete:*' min-input 7

# fzf
source /usr/share/fzf/shell/key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

