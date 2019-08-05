export ZSH="/home/gkeep/.oh-my-zsh"

ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  package       # Package version
  exec_time     # Execution time
  node          # Node.js section
  swift         # Swift section
  golang        # Go section
  rust          # Rust section
  pyenv         # Pyenv section
  dotnet        # .NET section
  line_sep      # Line break
  vi_mode
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
 )

 plugins=(
  zsh-autosuggestions
  git
  git-extras
  colored-man-pages
  fast-syntax-highlighting
  command-not-found
  themes
)

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

source "/home/gkeep/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

eval $(thefuck --alias)

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# rust
export PATH="$PATH:$CARGO_HOME/bin"
source $HOME/.cargo/env

# source aliases
source $HOME/.aliases
