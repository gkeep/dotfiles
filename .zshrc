export ZSH="/home/gkeep/.oh-my-zsh"

eval "$(starship init zsh)"

plugins=(
   zsh-completions
   zsh-autosuggestions
   git
   git-extras
   fast-syntax-highlighting
   command-not-found
   themes
)

autoload -U compinit && compinit

# tmux

# if which tmux >/dev/null 2>&1; then
#   # if no session is started, start a new session
#   test -z ${TMUX} && tmux
#
#   # when quitting tmux, try to attach
#   while test -z ${TMUX}; do
#       tmux attach || break
#   done
# fi
#
# launch_tmux() {
# [[ $- != *i* ]] && return
# [[ -z "$TMUX" ]] && exec tmux
#
# tmux source-file "$HOME/.tmux/tmuxline/iceberg_normal.tmux.conf"
# tmux source-file "$HOME/.tmux.conf"
# }
source $ZSH/oh-my-zsh.sh

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source aliases
source $HOME/.aliases
