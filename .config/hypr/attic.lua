local common = require("common")

local mod, exec, then_reset, leave_keys =
    common.mod, common.exec, common.then_reset, common.leave_keys

-- Unit step per direction, shared by the resize and move submaps; SHIFT multiplies by 5.
local offsets = { left = { -1, 0 }, down = { 0, 1 }, up = { 0, -1 }, right = { 1, 0 } }

hl.config({
    dwindle = {
        force_split                  = 2, -- 0 follows mouse, 1 left or top, 2 right or bottom
        preserve_split               = true,
        smart_resizing               = false,
        permanent_direction_override = true,
    },
})

-- top raises the active float above the other floats, bottom sends it behind them
hl.bind(mod .. " + SHIFT + T", hl.dsp.window.alter_zorder({ mode = "top" }))

hl.bind(mod .. " + G", hl.dsp.submap("group"))
hl.bind(mod .. " + R", hl.dsp.submap("resize"))
hl.bind(mod .. " + CTRL + M", hl.dsp.submap("move"))
hl.bind(mod .. " + SHIFT + M", hl.dsp.submap("mako"))
hl.bind(mod .. " + SHIFT + D", hl.dsp.submap("displays"))

hl.define_submap("group", function()
    then_reset("G", hl.dsp.group.toggle())
    then_reset("L", hl.dsp.group.lock_active({ action = "toggle" }))
    then_reset("A", hl.dsp.group.lock({ action = "lock" }))
    then_reset("SHIFT + A", hl.dsp.group.lock({ action = "unlock" }))
    then_reset("D", hl.dsp.window.move({ out_of_group = true }))

    -- Vertical keys walk the window through the group, horizontal ones change the active tab.
    for _, entry in ipairs({
        { { "E", "down" },  hl.dsp.group.move_window({ forward = false }) },
        { { "I", "up" },    hl.dsp.group.move_window({ forward = true }) },
        { { "N", "left" },  hl.dsp.group.prev() },
        { { "O", "right" }, hl.dsp.group.next() },
    }) do
        for _, key in ipairs(entry[1]) do
            hl.bind(key, entry[2], { repeating = true })
        end
    end

    for key, dir in pairs(common.dirs) do
        hl.bind("SHIFT + " .. key, hl.dsp.window.move({ into_group = dir }), { repeating = true })
    end

    leave_keys(mod .. " + SHIFT + G")
end)

hl.define_submap("resize", function()
    then_reset("SHIFT + H", hl.dsp.window.resize({ x = 720, y = 480 }))
    then_reset("SHIFT + V", hl.dsp.window.resize({ x = 480, y = 720 }))

    for key, dir in pairs(common.dirs) do
        local dx, dy = offsets[dir][1], offsets[dir][2]
        hl.bind(key, hl.dsp.window.resize({ x = dx * 10, y = dy * 10, relative = true }), { repeating = true })
        hl.bind("SHIFT + " .. key, hl.dsp.window.resize({ x = dx * 50, y = dy * 50, relative = true }),
            { repeating = true })
    end

    leave_keys(mod .. " + SHIFT + R")
end)

hl.define_submap("move", function()
    then_reset("C", hl.dsp.window.center()) -- for floating

    for key, dir in pairs(common.dirs) do
        local dx, dy = offsets[dir][1], offsets[dir][2]
        hl.bind(key, hl.dsp.window.move({ x = dx * 10, y = dy * 10, relative = true }), { repeating = true })
        hl.bind("SHIFT + " .. key, hl.dsp.window.move({ x = dx * 50, y = dy * 50, relative = true }),
            { repeating = true })
    end

    leave_keys(mod .. " + SHIFT + M")
end)

hl.define_submap("mako", "reset", function()
    exec("D", 'makoctl mode -a dnd; hyprctl notify 1 2000 "rgb(ff0000)" " DND"')
    exec("SHIFT + D", 'makoctl mode -r dnd; notify-send -t 2000 "dnd is off"')
    exec("A", "makoctl mode -a away")
    exec("SHIFT + A", "makoctl mode -r away")
    exec("G", "makoctl dismiss -g")
    exec("SHIFT + G", "makoctl dismiss -a")
    exec("R", "makoctl restore")
    exec("SHIFT + R", 'makoctl reload; notify-send -t 2000 "reloaded"')

    leave_keys(mod .. " + SHIFT + M")
end)

hl.define_submap("displays", "reset", function()
    exec("L", "~/.config/hypr/scripts/displays.sh eDP-1 -")
    exec("H", "~/.config/hypr/scripts/displays.sh HDMI-A-1 -")
    exec("A", "~/.config/hypr/scripts/displays.sh eDP-1 ''")
    exec("O", "~/.config/hypr/scripts/displays.sh '' -eDP-1")

    -- hyprctl keyword speaks hyprlang; under the Lua manager use the
    -- laptop_off flag in monitors.lua instead.
    exec("D", "hyprctl keyword monitor eDP-1,preferred,auto,1")
    exec("SHIFT + D", "hyprctl keyword monitor eDP-1,disable")

    leave_keys(mod .. " + SHIFT + D")
end)
