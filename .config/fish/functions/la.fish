function la --wraps ls --description 'List all files in directory using verbose format'
    ll -A --group-directories-first $argv
end
