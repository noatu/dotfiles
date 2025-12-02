function fish_user_key_bindings
    # if command -q fzf; and functions -q fzf_key_bindings
    set -gx FZF_CTRL_R_OPTS --reverse
    functions -q fzf_key_bindings; and fzf_key_bindings
    # else
    # echo (set_color brcyan)'INFO: fzf not found'
    # end

    bind -M insert ctrl-n accept-autosuggestion

    # Unused: alt-g, alt-z, insert ctrl-r

    bind alt-t transpose-words
    bind -M insert alt-t transpose-words
    bind -M visual alt-t transpose-words
    # bind            ctrl-t transpose-chars
    # bind -M insert  ctrl-t transpose-chars
    # bind -M visual  ctrl-t transpose-chars

    bind ctrl-z 'fish_commandline_append " &; disown"'
    bind -M insert ctrl-z 'fish_commandline_append " &; disown"'
    bind -M visual ctrl-z 'fish_commandline_append " &; disown"'

    bind ctrl-g lazygit
    bind -M insert ctrl-g lazygit
    bind -M visual ctrl-g lazygit

    bind -M insert alt-. history-token-search-backward
    bind -M visual alt-. history-token-search-backward
    bind -M insert alt-comma history-token-search-forward
    bind -M visual alt-comma history-token-search-forward

    # bind -M insert ctrl-d exit
end
