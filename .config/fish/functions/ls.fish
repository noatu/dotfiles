if command -q eza
    set -gx EZA_MIN_LUMINANCE 60
    function ls --wraps eza
        command eza -w 80 --icons --group-directories-last \
            --color-scale -g --smart-group --time-style '+%g.%m.%d
%m.%d %H:%M' -M $argv
    end
else
    status get-file functions/ls.fish | source
end
