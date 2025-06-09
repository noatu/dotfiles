function fish_user_key_bindings
    if command -q fzf
        set -gx FZF_CTRL_R_OPTS '--reverse'

        function bind; end # thanks fzf for not using `builtin`
        if functions -q fzf_key_bindings
            fzf_key_bindings
        else
            echo (set_color bryellow)'WARNING: using `fzf --fish | source`'
            command fzf --fish | source
        end
        functions -e bind

        # FZF_ALT_C_COMMAND, FZF_ALT_C_OPTS
        bind            alt-c fzf-cd-widget
        bind -M insert  alt-c fzf-cd-widget
        # FZF_CTRL_T_COMMAND, FZF_CTRL_T_OPTS
        bind            alt-f fzf-file-widget
        bind -M insert  alt-f fzf-file-widget
        # FZF_CTRL_R_OPTS
        bind            ctrl-f fzf-history-widget
        bind -M insert  ctrl-f fzf-history-widget
    else
        echo (set_color brcyan)'INFO: fzf not found'
    end

    # Unused: alt-z, insert ctrl-r

    bind            alt-t transpose-words
    bind -M insert  alt-t transpose-words
    bind -M visual  alt-t transpose-words
    bind            ctrl-t transpose-chars
    bind -M insert  ctrl-t transpose-chars
    bind -M visual  ctrl-t transpose-chars
    bind            ctrl-z 'fish_commandline_append " &; disown"'
    bind -M insert  ctrl-z 'fish_commandline_append " &; disown"'
    bind -M visual  ctrl-z 'fish_commandline_append " &; disown"'

    # bind -M insert ctrl-d exit
end
