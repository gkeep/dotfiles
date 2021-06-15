zstyle ':znap:*' repos-dir ~/.config/zsh-plugins
source ~/zsh-snap/znap.zsh

eval "$(starship init zsh)"

autoload -U compinit && compinit

export ZSH="/home/gkeep/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# source aliases
source $HOME/.aliases

# source znap plugins
# znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-syntax-highlighting

zstyle ':autocomplete:*' min-input 7

# fzf
source /usr/share/fzf/key-bindings.zsh
# source /usr/share/fzf/completion.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
