function music --wraps 'yt-dlp -x --embed-thumbnail --embed-chapters' --description 'Download music with yt-dlp'
    test -d $argv[-1]; or set -a argv "$XDG_MUSIC_DIR"
    echo "Downloading into $argv[-1]"

    command yt-dlp --extract-audio --embed-thumbnail --embed-chapters \
    --output "$argv[-1]/%(title)s.%(ext)s" $argv[..-2]
end
