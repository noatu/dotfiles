function remux --wraps ffmpeg --description 'remux to mp4'
    test -e /tmp/remux; or mkdir /tmp/remux

    # download file if input path is a url
    if string match -qr '^(https?://|youtu\.?be|[a-zA-Z0-9]{11}$)' $argv[1]
        set argv[1] (yt-dlp -q --force-overwrites --print after_move:filepath \
        -f 'bestvideo[height<=?1080][vcodec!=?av01]+bestaudio/best' \
        -o '/tmp/remux/download.%(ext)s' $argv[1])
        or return
    end

    # set output path to default one if not set
    set noask
    if not set -q argv[2]
        set noask -y
        set argv[2] /tmp/remux/out.mp4
    end

    ffmpeg $noask -i $argv[1] -c copy -movflags faststart $argv[2..]

    command -sq wl-copy; and wl-copy -t text/uri-list "file://$(realpath $argv[-1])"
end
