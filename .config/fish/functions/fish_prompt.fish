function fish_prompt --description 'Write out the prompt'
    # Save those before running anything
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.

    # Detect reflow from window size change
    if test "$__fish_prompt_term_dimensions" != "$COLUMNS$LINES"
        set -g __fish_prompt_term_dimensions "$COLUMNS$LINES"
        if set -q __fish_prompt
            echo -ns $__fish_prompt
            return
        end
    end

    # Write pipestatus if a command was issued
    # TODO: hardcode this mess
    if test "$__fish_prompt_status_generation" != $status_generation
        set -g __fish_prompt_status_generation $status_generation
        set -q fish_color_status; or set -g fish_color_status brred

        set -f prompt_status (__fish_print_pipestatus '' '' '|' '' (set_color --bold $fish_color_status) $last_pipestatus)
    end

    # Only show login if in SSH or container
    if not set -q prompt_host
        set -g prompt_host '' # global because it's slow and unchanging
        if set -q SSH_TTY; or begin
                command -sq systemd-detect-virt
                and systemd-detect-virt -q
            end
            set prompt_host "$(prompt_login) "
        end
    end

    if not set -q __prompt_suffix
        set -g __prompt_suffix '>'
        set -g __prompt_color_cwd fish_color_cwd

        if fish_is_root_user
            set __prompt_suffix '#'
            set -q fish_color_cwd_root; or set -g fish_color_cwd_root red
            set __prompt_color_cwd fish_color_cwd_root
        end
    end

    set -l suffix $__prompt_suffix
    if test "$fish_key_bindings" = fish_vi_key_bindings
        or test "$fish_key_bindings" = fish_hybrid_key_bindings
        switch $fish_bind_mode
            # case insert
            case default
                set suffix (set_color --bold brmagenta)N
            case visual
                set suffix (set_color --bold brcyan)V
            case replace_one
                set suffix (set_color --bold bryellow)R
            case replace
                set suffix (set_color --bold brred)R
        end
    end

    set -l n (set_color normal)
    set -g __fish_prompt $n $prompt_host (set_color $$__prompt_color_cwd) (prompt_pwd -D2) $n ' ' $prompt_status $suffix $n ' '
    echo -ns $__fish_prompt
end
