export ZSH="/home/gkeep/.oh-my-zsh"
ZSH_THEME="bira"
plugins=(
  git
  colored-man-pages
  cat
  command-not-found
  themes
)
source $ZSH/oh-my-zsh.sh
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
else
   export EDITOR='vim'
fi
if [[ $TERM == xterm-termite ]]; then
	export "TERM=xterm-256color"
fi
export SSH_KEY_PATH="~/.ssh/rsa_id"
