function music --wraps 'yt-dlp -x --embed-thumbnail --embed-chapters' --description 'Download music with yt-dlp'
    command yt-dlp --extract-audio --embed-thumbnail --embed-chapters \
        --output "$XDG_MUSIC_DIR/%(title)s.%(ext)s" $argv
end
