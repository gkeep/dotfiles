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
  git-extras
  colored-man-pages
  fast-syntax-highlighting
  command-not-found
  themes
)

alias ls="lsd"

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'
export SSH_KEY_PATH="~/.ssh/rsa_id"
source "/home/gkeep/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

eval $(thefuck --alias)

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
