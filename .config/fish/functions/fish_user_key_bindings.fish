function fish_user_key_bindings --description 'User defined key bindings'
    bind ctrl-t __tmux_key

    bind ctrl-z 'fg 2>/dev/null; commandline -f repaint'
    # sudo on esc,esc
    bind escape,escape __fish_prepend_sudo
end

function __tmux_key --description 'Attach or create new tmux'
    if not set -q TMUX 
        tmux a || tmux new
    end
end
