function fish_right_prompt
    # Detect reflow from window size change
    if test "$__fish_right_prompt_term_dimensions" != "$COLUMNS$LINES"
        set -g __fish_right_prompt_term_dimensions "$COLUMNS$LINES"
        if set -q __fish_right_prompt
            echo -ns $__fish_right_prompt
            return
        end
    end

    set -g __fish_git_prompt_showdirtystate 1
    set -g __fish_git_prompt_showuntrackedfiles 1
    set -g __fish_git_prompt_showupstream informative
    set -g __fish_git_prompt_showcolorhints 1
    set -g __fish_git_prompt_use_informative_chars 1

    # Unfortunately this only works if we have a sensible locale
    string match -qi '*.utf-8' -- $LANG $LC_CTYPE $LC_ALL
    and set -g __fish_git_prompt_char_dirtystate \U1F4a9
    set -g __fish_git_prompt_char_untrackedfiles '?'

    set -l vcs (fish_vcs_prompt '%s' 2>/dev/null)

    set -q VIRTUAL_ENV_DISABLE_PROMPT
    or set -g VIRTUAL_ENV_DISABLE_PROMPT true
    set -q VIRTUAL_ENV
    and set -l venv (string replace -r '.*/' '' -- "$VIRTUAL_ENV")

    # Count duration (optionally)
    if test $CMD_DURATION -gt 100 -a \
        "$__fish_right_prompt_status_generation" != $status_generation
        set -g __fish_right_prompt_status_generation $status_generation

        set -l secs (math -s2 $CMD_DURATION / 1000 % 60)
        set -l mins (math -s0 $CMD_DURATION / 60000 % 60)
        set -l hrs (math -s0 $CMD_DURATION / 3600000)
        set -l parts

        # Remove excess verbosity
        test $hrs -gt 0; and set -a parts $hrs'h'
        if test $mins -gt 0
            set -a parts $mins'm'
            set secs (math -s0 $secs) # drop millis when there are mins
        end
        test $secs -gt 0 -a $hrs -eq 0; and set -a parts $secs's'

        set -f duration (set_color white)(string join ':' -- $parts)
    end

    set -l n (set_color normal)
    set -g __fish_right_prompt $n $venv' ' $duration' ' $vcs' ' (set_color brblack) (date '+%R') $n
    echo -ns $__fish_right_prompt
end
