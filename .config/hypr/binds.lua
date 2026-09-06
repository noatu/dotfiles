local m = require("media")
local common = require("common")

local mod, exec = common.mod, common.exec

local slurp = "slurp -o -d -w 2 -B 00000000 -b 00000000 -s 00000000 -c"
local obs   = [[class:^(com\.obsproject\.Studio)$]]

hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + SHIFT + Q", hl.dsp.window.kill())
hl.bind(mod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mod .. " + SHIFT + F", hl.dsp.window.fullscreen_state({ internal = 0, client = 3 })) -- fool the window
hl.bind(mod .. " + CTRL + F", hl.dsp.window.fullscreen({ mode = "maximized" })) -- keep gaps and bars
hl.bind(mod .. " + P", hl.dsp.window.pin()) -- show floating on all workspaces
hl.bind(mod .. " + U", hl.dsp.focus({ urgent_or_last = true }))
hl.bind(mod .. " + B", hl.dsp.focus({ last = true }))
hl.bind(mod .. " + S", hl.dsp.workspace.toggle_special(""))
hl.bind(mod .. " + Tab", hl.dsp.workspace.move({ monitor = "+1" }))

hl.bind(mod .. " + SHIFT + Space", function()
    hl.dispatch(hl.dsp.window.float())
    hl.dispatch(hl.dsp.window.center())
end)

hl.bind(mod .. " + ALT + R", hl.dsp.force_renderer_reload())
exec(mod .. " + CTRL + R", "hyprctl reload")

hl.bind(mod .. " + CTRL + SHIFT + ALT + X", function()
    hl.dispatch(hl.dsp.exec_cmd("killall xdg-desktop-portal-hyprland"))
    hl.dispatch(hl.dsp.exit())
end)

hl.bind(mod .. " + T", hl.dsp.layout("orientationcycle left top right bottom"))
hl.bind(mod .. " + A", hl.dsp.layout("addmaster"))
hl.bind(mod .. " + SHIFT + A", hl.dsp.layout("removemaster"))

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

exec(mod .. " + Return", "kitty")
exec(mod .. " + KP_Enter", "kitty")

hl.bind(mod .. " + L", hl.dsp.submap("launch"))
hl.bind(mod .. " + W", hl.dsp.submap("wallpaper"))
hl.bind(mod .. " + SHIFT + S", hl.dsp.submap("system"))

-- TRUE scratchpad, i3 style
hl.bind(mod .. " + minus", hl.dsp.window.move({ workspace = "special", follow = false }))
hl.bind(mod .. " + equal", function()
    hl.dispatch(hl.dsp.workspace.toggle_special(""))
    hl.dispatch(hl.dsp.window.cycle_next({ next = false })) -- first in first out
    hl.dispatch(hl.dsp.window.move({ workspace = "+0" }))
end)

for key, dir in pairs(common.dirs) do
    hl.bind(mod .. " + " .. key, hl.dsp.focus({ direction = dir }))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ direction = dir }))
end

hl.bind(mod .. " + CTRL + E", hl.dsp.window.cycle_next())
hl.bind(mod .. " + CTRL + I", hl.dsp.window.cycle_next({ next = false }))
hl.bind(mod .. " + CTRL + N", hl.dsp.window.move({ workspace = "r-1" })) -- r for current monitor
hl.bind(mod .. " + CTRL + O", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind(mod .. " + CTRL + left", hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mod .. " + CTRL + right", hl.dsp.window.move({ workspace = "+1" }))

for ws = 1, 10 do
    local key = tostring(ws % 10)
    hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = ws }))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = ws }))
    hl.bind(mod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = ws, follow = false }))
end

-- Volume: bare key is the coarse step, SHIFT the fine one. The F row also drives
-- the focused player's own volume on CTRL.
local function volume_keys(down, up, base, player)
    exec(base .. down, m.sink(-5), { repeating = true })
    exec(base .. up, m.sink(5), { repeating = true })
    exec("SHIFT + " .. down, m.sink(-1), { repeating = true })
    exec("SHIFT + " .. up, m.sink(1), { repeating = true })

    if player then
        exec("CTRL + " .. down, m.player(-5), { repeating = true })
        exec("CTRL + " .. up, m.player(5), { repeating = true })
        exec(mod .. " + CTRL + " .. down, m.player(-1), { repeating = true })
        exec(mod .. " + CTRL + " .. up, m.player(1), { repeating = true })
    end
end

volume_keys("F1", "F2", mod .. " + ", true)
volume_keys("XF86AudioLowerVolume", "XF86AudioRaiseVolume", "", false)

-- Only the default step needs to survive the lock screen.
local function backlight_keys(down, up, base)
    exec(base .. down, m.backlight(-5), { repeating = true, locked = true })
    exec(base .. up, m.backlight(5), { repeating = true, locked = true })
    exec("CTRL + " .. down, m.backlight(-1), { repeating = true })
    exec("CTRL + " .. up, m.backlight(1), { repeating = true })
    exec("SHIFT + " .. down, m.backlight(-15), { repeating = true })
    exec("SHIFT + " .. up, m.backlight(15), { repeating = true })
end

backlight_keys("F11", "F12", mod .. " + ")
backlight_keys("XF86MonBrightnessDown", "XF86MonBrightnessUp", "")

exec(mod .. " + ALT + F11", m.ddc(-5), { repeating = true, locked = true })
exec(mod .. " + ALT + F12", m.ddc(5), { repeating = true, locked = true })

exec(mod .. " + F3", m.play_pause)
exec("SHIFT + F3", m.play_pause_all)

hl.bind(mod .. " + F4", hl.dsp.send_shortcut({ mods = "", key = "F4", window = obs }))
hl.bind(mod .. " + SHIFT + F4", hl.dsp.send_shortcut({ mods = "SHIFT", key = "F4", window = obs }))

-- Off and on get their own key so that off keeps working on the lock screen.
exec(mod .. " + F5", m.mic_mute, { locked = true })
exec("SHIFT + F5", m.mic_unmute)
exec(mod .. " + F6", m.sink_mute, { locked = true })
exec("SHIFT + F6", m.sink_unmute)
exec(mod .. " + F7", m.bt_off, { locked = true })
exec("SHIFT + F7", m.bt_on)
exec(mod .. " + F8", m.wifi_off, { locked = true })
exec("SHIFT + F8", m.wifi_on)

exec(mod .. " + F9", m.prev)
exec(mod .. " + F10", m.next)

exec("XF86AudioMute", m.sink_mute, { locked = true })
exec("SHIFT + XF86AudioMute", m.sink_unmute)
exec("XF86AudioMicMute", m.mic_toggle)
exec("XF86AudioPlay", m.play_pause)
exec("XF86AudioPrev", m.prev)
exec("XF86AudioNext", m.next)

local stamp = [[$(date +'%-d.%m.%y-%H:%M:%S')]]

-- instant region not saved
exec("Print", 'wl-copy -c; grim -g "$(' .. slurp .. ' ff0000 && sleep 0.1)" -t png -l 6 - | wl-copy -t image/png')
-- delayed region not saved
exec("CTRL + Print", 'grim -g "$(' .. slurp .. ' 00ffff && sleep 3)" -t png -l 6 - | wl-copy -t image/png')
-- instant fullscreen not saved
exec("SHIFT + Print",
    [[grim -o $(hyprctl activeworkspace | grep -Po '(?<=\d\) on monitor ).*?(?=:)') -t png -l 6 - | wl-copy -t image/png]])
-- delayed fullscreen not saved
exec("SHIFT + CTRL + Print",
    [[sleep 3; grim -o $(hyprctl monitors | grep -Po '(?<=Monitor ).*?(?= \(ID \d*\):)') -t png -l 6 - | wl-copy -t image/png]])
-- instant region saved
exec(mod .. " + Print",
    'grim -g "$(' .. slurp .. ' 00ff00 && sleep 0.1)" -t png -l 6 - | tee $SCREENSHOT_DIR/' .. stamp ..
    '.png | wl-copy -t image/png')
