#!/usr/bin/bash

while [ 1 ]; do
    if [[ $(hyprctl monitors) = *HEADLESS* ]]; then
        ~/.config/hypr/scripts/displays.sh eDP-1 ''
    fi
    sleep 1
done
