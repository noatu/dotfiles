status is-interactive; or return

status is-login; and abbr H Hyprland

abbr l la
abbr m mkdir
abbr o open
abbr t trash
# abbr m mpv
abbr mm -- mpv --shuffle \$XDG_MUSIC_DIR

abbr g git
# abbr dots -- git --git-dir \~/.dotfiles/ --work-tree \~
abbr gl git log
abbr ga git add
abbr gc git commit
abbr gs git status
abbr gcl git clone
abbr gco git checkout


function __last_hist_item; printf $history[1]; end
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
    string repeat -n (math (string length -- $argv) - 1) ../
end
abbr multidot -r '\.\.\.+$' -p anywhere -f __multidot

function __multicd; echo cd (__multidot $argv); end
abbr multicd -r '^\.\.+$' -f __multicd
