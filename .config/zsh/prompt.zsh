git_branch_test_color() {
  local ref=$(git symbolic-ref --short HEAD 2> /dev/null)
  if [ -n "${ref}" ]; then
    if [ -n "$(git status --porcelain)" ]; then
      local gitstatuscolor='%F{red}'
    else
      local gitstatuscolor='%F{green}'
    fi
    echo "${gitstatuscolor} (${ref})"
  else
    echo ""
  fi
}
setopt PROMPT_SUBST
# PROMPT='%F{blue}%m%F{none} %9c$(git_branch_test_color)%F{none} %# '
PROMPT='%F{blue}%m%F{none} %(5~|../%3~|%~)$(git_branch_test_color)%F{none} %# '

# add 24h time the right side
# RPROMPT='%D{%k:%M:%S}'

