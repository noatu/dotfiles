set -gx XDG_CONFIG_HOME ~/.config
set -gx XDG_CACHE_HOME ~/.cache
set -gx XDG_STATE_HOME ~/.local/state
set -gx XDG_DATA_HOME ~/.local/share

set -gx XDG_MUSIC_DIR ~/music
set -gx XDG_VIDEOS_DIR ~/vid
set -gx XDG_PICTURES_DIR ~/pic
set -gx XDG_DOCUMENTS_DIR ~/doc

set -gx XDG_DESKTOP_DIR /tmp
set -gx XDG_DOWNLOAD_DIR /tmp
# set -gx XDG_TEMPLATES_DIR   "$HOME/"
# set -gx XDG_PUBLICSHARE_DIR "$HOME/"

set -gx GOPATH $XDG_DATA_HOME/go # GOOUT my home
set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx CLIPPY_CONF_DIR $XDG_DATA_HOME/cargo/

# Can't use '~' in universal variables
fish_add_path -g ~/.local/bin $CARGO_HOME/bin $GOPATH/bin

set -gx npm_config_prefix ~/.local

# -agx is a bad idea as login shell itself also does it
# set -gx WINEPATH /usr/x86_64-w64-mingw32/bin
# set -gx CPATH    /usr/x86_64-w64-mingw32/include
set -gx WINEPATH /opt/llvm-mingw/x86_64-w64-mingw32/bin/

set -gx BROWSER librewolf

# Convenience
set -gx SCREENSHOT_DIR $XDG_PICTURES_DIR/screen
set -gx SCREENRECORD_DIR $XDG_VIDEOS_DIR/screen

# Find an editor
for e in hx helix nvim vim vi nano
    type -q $e; or continue
    set -gx EDITOR $e
    break
end
type -q nvim; and set -gx MANPAGER nvim +Man!

test -S ~/.bitwarden-ssh-agent.sock
and set -gx SSH_AUTH_SOCK ~/.bitwarden-ssh-agent.sock

# SSH with GPG
# set -e SSH_AGENT_PID
# set -gx GPG_TTY (tty)
# set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
# gpg-connect-agent updatestartuptty /bye >/dev/null
