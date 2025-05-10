function la --wraps 'ls' --description 'List all files in directory using verbose format'
    ls -lAh --group-directories-first $argv
end
