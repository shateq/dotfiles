export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_CACHE_HOME/zsh_history"
export LESSHISTFILE="$XDG_CACHE_HOME/less_history"

HISTCONTROL=ignoreboth # duplicates and starting with space ignored
HIST_STAMPS="dd.mm.yyyy"
HISTSIZE=10000
SAVEHIST=10000

#: colored man pages
export LESS="-R"
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
