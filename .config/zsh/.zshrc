# scripts
SCRIPTS=$HOME/dotfiles/scripts
[ -f "$SCRIPTS/aliasrc" ] && source $SCRIPTS/aliasrc
source $SCRIPTS/dmenu-places

# enable colors and change prompt
autoload -U colors && colors

#greeter
echo -e "\n\e[40;97m $(date +"%d %b %Y") >\e[0m\e[100;97m> $(uptime -p) \e[0m"

PROMPT="%K{cyan}%F{black} %T %K{blue} %n %f%k ; "
RPROMPT="%F{magenta}%~%f"
#PROMPT='\033[30;46m $(date +"%R") \033[0m\033[30;44M $(whoami) \033[0m ; '

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

zinit snippet OMZL::git.zsh
zi snippet OMZP::git
#zi cdclear -q #forget completions
zi snippet OMZP::sudo
#zi snippet OMZP::fancy-ctrl-z #BROKEN

zi ice lucid wait'0'
zi light joshskidmore/zsh-fzf-history-search

zi ice lucid wait'3'
zi light zdharma-continuum/fast-syntax-highlighting

# completions
zmodload zsh/complist
autoload -U compinit && compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
# zstyle ':completion:*' file-list true # more detailed list
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

# keybinds
# disable vi-mode (it sucks, open line in vim with ^n)
bindkey -e

# uses EDITOR env var
autoload edit-command-line
zle -N edit-command-line
bindkey '^n' edit-command-line

# start nnn in current dir
openn3() {
    nnn <$TTY
    zle redisplay
}
zle -N openn3
bindkey '^f' openn3

# plugin wont work without vi-mode
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

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^h" backward-word
bindkey "^l" forward-word
bindkey "^x" backward-kill-word
bindkey "^j" history-search-forward
bindkey "^k" history-search-backward
