if command -q eza
    function tree --wraps eza
        ls -T $argv
    end
else if command -q tree
    function tree
        command tree -C --filesfirst $argv
    end
else
    function tree
        ls -l --group-directories-first
    end
end
