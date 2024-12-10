# See: https://github.com/ohmyzsh/ohmyzsh/wiki/Customization#overriding-and-adding-themes

function status_parse {
  STATUS="$(print -P "%?")"
  if [[ "$STATUS" -ne 0 ]]; then
    echo $(print -P ", %{$bg[red]%}$STATUS%{$reset_color%}")
  else
    echo $(print -P ", %{$bg[lime]%}$STATUS%{$reset_color%}")
  fi  
}

function git_branch {
  BRANCH_NAME=$(git_current_branch)
  #parse_git_dirtu
  print $BRANCH_NAME
}

wd="%{$fg[magenta]%}%~%{$reset_color%}"
hour="%{$bg[cyan]%}%{$fg[black]%} %T %{$reset_color%}"
user="%{$bg[blue]%}%{$fg[black]%} %n %{$reset_color%}"
branch="%{$fg[red]%}[%{$reset_color%} %{$fg[red]%}]%{$reset_color%}"

PROMPT='$hour$user %\; '
RPROMPT='$wd, $branch'
