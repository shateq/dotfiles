autoload -U colors && colors

#: GREETER
PROMPT="%F{black}%K{blue} %n %K{cyan} %2d %f%k %(?..%F{red}%? )%f%k; "
RPROMPT="%F{magenta}%T%f"

#: ssh-agent
# start if not running
if [ -z "$SSH_AUTH_SOCK" ]; then
    local agent_env="$XDG_CACHE_HOME/ssh-agent.env"

    if [ -f "$agent_env" ]; then
        source "$agent_env" >/dev/null
    fi

    if ! pgrep -u "$USER" ssh-agent >/dev/null; then
        ssh-agent > "$agent_env"
        source "$agent_env" >/dev/null
    fi

fi

###########
#: MAIN ZSH
setopt autocd
setopt extended_glob noglobdots
setopt longlistjobs # report PID on suspend
setopt noshwordsplit # zsh style word splitting
#setopt nohup # dont kill background processess
stty stop undef # disable accidental ctrl s

setopt append_history 
setopt share_history
setopt histignorespace
setopt histignoredups

HISTFILE="$XDG_CACHE_HOME/zsh_history"
HISTSIZE=5000
SAVEHIST=5000

# export MANPAGER="nvim +Man!"
# Colored man pages
# export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-c"

export LESS_TERMCAP_mb=$'\e[1;32m'     # begin blinking
export LESS_TERMCAP_md=$'\e[1;32m'     # begin bold
export LESS_TERMCAP_me=$'\e[0m'        # end mode
export LESS_TERMCAP_so=$'\e[01;44;33m' # begin standout-mode (search)
export LESS_TERMCAP_se=$'\e[0m'        # end standout-mode
export LESS_TERMCAP_us=$'\e[1;4;31m'   # begin underline
export LESS_TERMCAP_ue=$'\e[0m'        # end underline

#: Completion
setopt hash_list_all # on cmp ensures correction but may be slow
setopt auto_param_slash # slash/ for dirs in cmp menu
setopt auto_menu # fish-like
setopt completeinword
setopt no_case_glob no_case_match # case insensitive cmp

zmodload zsh/complist
autoload -U compinit && compinit

zstyle ':completion:*' menu select=3 # only use menu if more than 3 opts
zstyle ':completion:*' special-dirs .. # .. will show 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # match uppercase from lowercase
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # colorize cmp menu
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion
##zstyle ':completion:*:descriptions' format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}' # format on cmp menu
# complete manual by their section
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select
zstyle ':completion:*'            use-cache yes
zstyle ':completion:*:complete:*' cache-path "$HOME/.cache"
# complete cd -<tab> with menu, dirs integration
zstyle ':completion:*:*cd:*:directory-stack' menu yes select

#: Correction
setopt correct # correction nyae
zstyle ':completion:*:correct:*' max-errors 1 # only correct if 1 typo

##########
#: PLUGINS
ZINIT_HOME="${XDG_DATA_HOME}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zi snippet OMZL::git.zsh
zi snippet OMZP::sudo

zinit pack for ls_colors

#zi cdclear -q #forget completions
zi ice lucid wait'3'
zi light zdharma-continuum/fast-syntax-highlighting

[ -f "$XDG_CONFIG_HOME/shell/aliasrc" ] && source $XDG_CONFIG_HOME/shell/aliasrc
[ -f "$XDG_CONFIG_HOME/zsh/dirs.zsh" ]  && source $XDG_CONFIG_HOME/zsh/dirs.zsh
[ -f "$XDG_CONFIG_HOME/zsh/binds.zsh" ]  && source $XDG_CONFIG_HOME/zsh/binds.zsh
