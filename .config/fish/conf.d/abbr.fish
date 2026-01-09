set -q MY_ABBRS_INITIALIZED; and return # guard

abbr -a d cdh
abbr -a -- g "git"
abbr -a -- v "$EDITOR"
abbr -a -- tarls 'tar -tvf'
abbr -a -- untar 'tar -xv'

abbr -a --position anywhere A "| awk"
abbr -a --position anywhere G "| grep"
abbr -a --position anywhere L --set-cursor "% | less"

set -g MY_ABBRS_INITIALIZED true
