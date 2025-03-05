# main zsh settings

[ -f "$HOME/dotfiles/scripts/aliases.sh" ] && source "$HOME/dotfiles/scripts/aliases.sh"

# modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors

# completion
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
# zstyle ':completion:*' file-list true # more detailed list
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

# main options
setopt append_history inc_append_history share_history # better history
setopt auto_menu menu_complete # autocmp first menu match
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt autocd # type a dir to cd
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^
#setopt interactive_comments # allow comments in shell
unsetopt prompt_sp # don't autoclean blanklines
stty stop undef # disable accidental ctrl s

# plugin manager

#$ZSH/themes or $ZSH_CUSTOM/themes
ZSH_THEME="exemplary"
# $ZSH/plugins or $ZSH_CUSTOM/plugins
plugins=(git sudo rust)
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/dotfiles/zshcustom"
# sourc
source $ZSH/oh-my-zsh.sh

zstyle ':omz:update' mode disabled  # disable automatic updates

# use hyphen-insensitive completion. interchangeable _ and -. Case-sensitive must be off
HYPHEN_INSENSITIVE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. making repository status check for large repositories much faster
DISABLE_UNTRACKED_FILES_DIRTY="true"

# history
HIST_STAMPS="dd.mm.yyyy"
HISTSIZE=8000
SAVEHIST=8000
HISTFILE="$XDG_CACHE_HOME/zsh_history"
HISTCONTROL=ignoreboth # duplicates and starting with space ignored

# custom scripts
source ~/dotfiles/scripts/dmenu-places

# keybinds
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^j" backward-word
bindkey "^k" forward-word
bindkey "^H" backward-kill-word
# ctrl J & K for going up and down in prev commands
bindkey "^J" history-search-forward
bindkey "^K" history-search-backward

# fzf integration 
source <(fzf --zsh)
bindkey '^R' fzf-history-widget

openn3() {
    nnn <$TTY
    zle redisplay
}
zle -N openn3
bindkey '^F' openn3

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line -w
  else
    zle push-input -w
    zle clear-screen -w
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# pywal
(cat ~/.cache/wal/sequences &)
