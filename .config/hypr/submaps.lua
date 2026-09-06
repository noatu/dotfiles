local common = require("common")

local mod, exec, leave_keys = common.mod, common.exec, common.leave_keys

-- The "reset" argument drops back to the global map after any bind fires, so
-- none of these need a reset line of their own.
hl.define_submap("launch", "reset", function()
    -- apps
    exec("F", "librewolf")
    exec("SHIFT + F", "firefox")
    exec("CTRL + F", "torbrowser-launcher")
    exec("C", "helium-browser")
    exec("T", "Telegram")
    exec("SHIFT + T", "killall Telegram")
    exec("S", "killall signal-desktop || signal-desktop")
    exec("M", "mpv --force-window --idle")
    exec("E", "kitty hx")
    exec("N", "nemo")
    exec("SHIFT + N", "nheko")
    exec("Y", "kitty yazi")
    exec("L", "logseq")
    exec("O", "obsidian --force-device-scale-factor=2")
    exec("SHIFT + O", "QT_SCALE_FACTOR=1 obs")
    exec("K", "klavaro")
    exec("SHIFT + S", "steam")
    exec("D", "vesktop")
    exec("SHIFT + D", "drawing")
    exec("V", "bitwarden-desktop")
    exec("SHIFT + V", "QT_SCALE_FACTOR=1.5 virtualbox")
    exec("SHIFT + W", "/opt/winboat/winboat")
    exec("SHIFT + B", "flatpak run com.usebottles.bottles")
    exec("Q", "qbittorrent")
    exec("A", "anytype")

    -- utilities
    exec("P", "pavucontrol")
    exec("SHIFT + P", "easyeffects")
    exec("B", "blueman-manager")
    exec("SHIFT + C", "nm-connection-editor")
    exec("SHIFT + E", "killall nm-applet || nm-applet")
    exec("SHIFT + A", "wdisplays") -- a for arandr

    -- makes life easier
    exec("X", "~/.config/hypr/scripts/xdph.sh")
    exec("G", "killall gammastep || gammastep -m wayland -PO 4000")
    exec("SHIFT + L", "swaylock")
    exec("H", "killall hyprpaper || hyprpaper")
    exec("SHIFT + H", "helvum")
    exec("W", "pkill -USR1 waybar")

    leave_keys(mod .. " + L")
end)

hl.define_submap("wallpaper", "reset", function()
    for i = 0, 9 do
        exec(tostring(i), "hyprctl hyprpaper wallpaper ,.walls/wall" .. i)
    end

    leave_keys(mod .. " + W")
end)

hl.define_submap("system", "reset", function()
    exec("S", "shutdown now")
    exec("R", "systemctl reboot")
    exec("Z", "systemctl suspend")

    leave_keys(mod .. " + SHIFT + S")
end)
