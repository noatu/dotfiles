if command -q eza
    function ll --wraps ls --description 'List contents of directory using long format'
        ls -l $argv
    end
else
    function ll --wraps ls --description 'List contents of directory using long format'
        ls -lh --group-directories-first $argv
    end
end
