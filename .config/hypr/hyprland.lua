require("monitors")
require("settings")
require("rules")
require("binds")
require("submaps")
-- require("attic") -- dwindle, alter_zorder, group/resize/move/mako/displays submaps

hl.env("XCURSOR_SIZE", "24")

hl.env("ANKI_WAYLAND", "1")

hl.env("GDK_BACKEND", "wayland")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1") -- enable auto scaling, depending on dpi
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("gammastep -m wayland -PO 4000")
    -- asks for a password whenever an app wants to elevate its privileges
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("swayidle -w")
    hl.exec_cmd("waybar")
    hl.exec_cmd("udiskie")
end)

-- icon: none, warning, info, hint, error, confused, ok
hl.notification.create({ text = "Config applied", timeout = 1000, color = "rgb(00ff00)", icon = "none" })
