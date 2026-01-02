function cached_source -d 'cache the command result for sourcing'
    set -l cache_dir $__fish_config_dir/source
    test -e $cache_dir; or mkdir $cache_dir; or return

    command -q -- $argv[1]; or return

    set -l cache_file $cache_dir/$argv[1].fish
    if status is-login; or not test -e $cache_file
        command $argv >$cache_file; or return
    end

    source $cache_file
end

function cached_source_static -d 'source the cached command result'
    test -e $__fish_config_dir/source/$argv[1].fish
    and source $__fish_config_dir/source/$argv[1].fish
    or cached_source $argv
end

cached_source direnv hook fish

status is-interactive; or return
cached_source zoxide init fish
cached_source trashy completions fish
cached_source sqlx completions fish

cached_source_static zmk --show-completion
