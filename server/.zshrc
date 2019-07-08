export ZSH="/home/gkeep/.oh-my-zsh"

ZSH_THEME="alien-minimal/alien-minimal"
# theme customization
export AM_THEME=terminal
export AM_HIDE_EXIT_CODE=1
export AM_USE_NERD_FONT=1
export AM_SHOW_FULL_DIR=1
export AM_PROMPT_START_TAG='-> '
export AM_PROMPT_END_TAG=' $'

plugins=(
  git
  command-not-found
  themes
)

source $ZSH/oh-my-zsh.sh

export EDITOR="vim"

if [[ -n $SSH_CONNECTION ]]; then
    export TERM="xterm-256color"
fi

export SSH_KEY_PATH="~/.ssh/rsa_id"
source ~/.bash_aliases
