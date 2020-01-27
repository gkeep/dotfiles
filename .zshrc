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

extract() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
            *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
                   c=(bsdtar xvf);;
            *.7z)  c=(7z x);;
            *.Z)   c=(uncompress);;
            *.bz2) c=(bunzip2);;
            *.exe) c=(cabextract);;
            *.gz)  c=(gunzip);;
            *.rar) c=(unrar x);;
            *.xz)  c=(unxz);;
            *.zip) c=(unzip);;
            *)     echo "$0: unrecognized file extension: \`$i'" >&2
                   continue;;
        esac

        command "${c[@]}" "$i"
        ((e = e || $?))
    done
    return "$e"
}

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
