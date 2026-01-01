status is-interactive; or return

status is-login; and abbr H start-hyprland

abbr m mkdir
abbr o open
abbr t trashy put
abbr b bat -p
# abbr m mpv
abbr ma -- mpv --profile=anime .
abbr mm -- mpv --profile=music --shuffle \$XDG_MUSIC_DIR

abbr lg lazygit
# abbr dots -- git --git-dir \~/.dotfiles/ --work-tree \~
abbr gl git log
abbr ga git add
abbr gc git commit
abbr gs git status
abbr gco git checkout

function __last_hist_item
    printf $history[1]
end
abbr !! -p anywhere -f __last_hist_item

function __find_editor --description 'Edit with edit-in-kitty when in ssh'
    if set -q SSH_TTY; and type -q edit-in-kitty
        printf edit-in-kitty
    else
        printf $EDITOR
    end
end
abbr e -f __find_editor

function __ssh_kitten --description 'Use ssh kitten if available'
    type -q kitten; and printf 'kitten '
    printf ssh
end
abbr s -f __ssh_kitten

function __multidot --description 'Use .... instead of ../../../'
    echo -ns (string repeat -n (math (string length -- $argv) - 1) ../) %
end
abbr multidot -r '\.\.\.+$' -p anywhere --set-cursor -f __multidot

function __multicd
    echo cd (__multidot $argv)
end
abbr multicd -r '^\.\.+$' --set-cursor -f __multicd
