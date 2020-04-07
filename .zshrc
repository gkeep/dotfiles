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

source $ZSH/oh-my-zsh.sh

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source aliases
#source $HOME/.aliases
