function dots --wraps 'git --git-dir ~/.dotfiles/ --work-tree ~' --description 'Track dotfiles with git'
    command git --git-dir ~/.dotfiles/ --work-tree ~ $argv
end
