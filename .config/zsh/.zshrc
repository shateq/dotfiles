# main zsh settings
setopt autocd # type a dir to cd
setopt append_history inc_append_history share_history # better history
setopt auto_menu menu_complete # autocmp first menu match
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^
#setopt interactive_comments # allow comments in shell
unsetopt prompt_sp # don't autoclean blanklines
stty stop undef # disable accidental ctrl s

# history
HIST_STAMPS="dd.mm.yyyy"
HISTSIZE=8000
SAVEHIST=8000
HISTFILE="$XDG_CACHE_HOME/zsh_history"
HISTCONTROL=ignoreboth # duplicates and starting with space ignored

#
# plugin manager
#
ZINIT_HOME="${XDG_DATA_HOME}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zi snippet OMZL::git.zsh

zinit snippet OMZP::git
#zi cdclear -q #forget completions
zinit snippet OMZP::sudo

zinit light zdharma-continuum/fast-syntax-highlighting

# completions
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors

zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
# zstyle ':completion:*' file-list true # more detailed list
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

#
# PROMPT
#

#PROMPT='\033[30;46m $(date +"%R") \033[0m\033[30;44M $(whoami) \033[0m ; '
PROMPT="%K{cyan}%F{black} %T %K{blue} %n %f%k ; "
RPROMPT="%F{magenta}%~$f"

# keybinds
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^j" backward-word
bindkey "^k" forward-word
bindkey "^H" backward-kill-word
# ctrl J & K for going up and down in prev commands
bindkey "^J" history-search-forward
bindkey "^K" history-search-backward

#
# scripts
#
SCRIPTS=$HOME/dotfiles/scripts
source $SCRIPTS/setwidgets.zsh
source $SCRIPTS/dmenu-places
[ -f "$SCRIPTS/aliasrc" ] && source "$SCRIPTS/aliasrc"

# pywal
(cat ~/.cache/wal/sequences &)
