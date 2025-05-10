#!/usr/bin/bash
VAR=$(pidof wl-screenrec | wc -w)
if [ $VAR = 0 ]; then
    echo '-'
else
    echo "󰑋 $VAR"
fi
