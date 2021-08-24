# vim: ft=bash
export EDITOR="nvim"

# nnn-related aliases
export NNN_USE_EDITOR=1
export NNN_SSHFS_OPTS="sshfs -o follow_symlinks"

# ssh-related aliases
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export SSH_KEY_PATH="$HOME/.ssh/id_ed25519"

# custom bin loacitons
export PATH="$PATH:$HOME/.local/bin:/var/lib/flatpak/exports/bin"

# fzf colors
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color fg:#c6c8d1,bg:#161821,hl:#84a0c6,fg+:#c6c8d1,bg+:#1e2132,hl+:#84a0c6
--color pointer:#e27878,info:#e2a478,spinner:#89b8c2,header:#b4be82,prompt:#84a0c6,marker:#b4be82'

export STEAMGAMES="/home/gkeep/Games/Steam/steamapps/common"

# wayland
# GDK_BACKEND="wayland"
# native firefox on wayland
export MOZ_ENABLE_WAYLAND=1

# gpg key
export GPG_TTY=$(tty)

case "$DESKTOP_SESSION" in
    i3)
        export $(gnome-keyring-daemon --start)
        ;;
    sway)
        export $(gnome-keyring-daemon --start)
        ;;
    bspwm)
        export $(gnome-keyring-daemon --start)
        ;;
esac
