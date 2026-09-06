local laptop_off      = false -- true: run on the external only
local external_rotate = 0     -- 1 = 90deg, 2 = 180deg, 3 = 270deg (portrait)

hl.monitor({
    output    = "DP-6",
    mode      = "preferred",
    position  = "0x0",
    scale     = 1,
    transform = external_rotate,
})

if laptop_off then
    hl.monitor({ output = "eDP-1", disabled = true })
else
    hl.monitor({
        output   = "eDP-1",
        mode     = "preferred",
        position = "320x1080",
        scale    = "auto",
    })
end

-- Catch-all for anything else plugged in.
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })
