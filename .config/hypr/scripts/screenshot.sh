#!/usr/bin/bash
# I have no idea what is this script

grim -s1 -t png -l0 -o "$(hyprctl activeworkspace | grep -Po '(?<=\d\) on monitor ).*?(?=:)')" /tmp/screenshot.png
hyprctl dispatch workspace 11
swayimg -n /tmp/screenshot.png &
IMG_PID=$!
sleep 0.2; hyprctl dispatch fullscreen
convert -crop $(slurp -odw 2 -B 00000000 -b 00000000 -s 00000000 -c 88CCFF -f "%wx%h+%X+%Y") /tmp/screenshot.png - | wl-copy -t image/png
hyprctl dispatch workspace previous
kill $IMG_PID
