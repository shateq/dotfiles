set -q MY_ABBRS_INITIALIZED; and return # guard

#: Dirs
abbr -a "~d" "~/Documents"
abbr -a "~dw" "~/Downloads"
abbr -a "~p" "~/Projects"
abbr -a "~pics" "~/Pictures"

abbr -a d cdh
abbr -a g "git"
abbr -a v "$EDITOR"
abbr -a mkd mkdir
abbr -a rmd rm -r
abbr -a sln "ln -s" 
abbr -a -- tarls "tar -tvf"
abbr -a -- untar "tar -xv'"
command -v "xdg-open" >/dev/null && abbr -a "open" "xdg-open"

abbr -a --position anywhere A "| awk"
abbr -a --position anywhere G "| grep"
abbr -a --position anywhere E --set-cursor "% | nvim -"
abbr -a --position anywhere L --set-cursor "% | less"

set -g MY_ABBRS_INITIALIZED true
