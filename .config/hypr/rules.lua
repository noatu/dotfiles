for ws = 1, 5 do
    hl.workspace_rule({ workspace = tostring(ws), monitor = "DP-6", default = ws == 1 })
end

for ws = 6, 8 do
    hl.workspace_rule({ workspace = tostring(ws), monitor = "eDP-1" })
end

hl.workspace_rule({ workspace = "10", no_border = true, no_rounding = true })

-- Smart gaps: drop gaps and borders when a workspace holds a single tiled
-- window (w[tv1]) or a single fullscreen one (f[1]).
for _, ws in ipairs({ "w[tv1]", "f[1]" }) do
    hl.workspace_rule({ workspace = ws, gaps_in = 0, gaps_out = 0 })
    hl.window_rule({ match = { float = false, workspace = ws }, border_size = 0, rounding = 0 })
end

-- Tearing
for _, game in ipairs({
    { match = { class = [[Liftoff.*]] } },
    { match = { class = [[Albion-Online]] } },
    { match = { initial_title = [[Minecraft.*]] }, render_unfocused = true },
    { match = { class = [[cs2]] },                 render_unfocused = true },
}) do
    game.monitor    = "1"
    game.workspace  = "10"
    game.immediate  = true
    game.fullscreen = true
    hl.window_rule(game)
end

-- Muh privacy
hl.layer_rule({ match = { namespace = [[^(notifications)$]] }, no_screen_share = true })
hl.window_rule({
    match = { class = [[^(Bitwarden|veracrypt|nheko|vesktop|org\.telegram\.desktop|com\.obsproject\.Studio)$]] },
    no_screen_share = true,
})

hl.window_rule({
    match = { class = [[^(Bitwarden|cmst|nemo|qt5ct|waypaper|nwg-look|wdisplays|VirtualBox|pavucontrol|connman-gtk|blueman-manager|org\.gnome\.Software|nm-connection-editor|org\.kde\.polkit-kde-authentication-agent-1)$]] },
    float = true,
})
hl.window_rule({
    match = { class = [[^(org.telegram.desktop|telegramdesktop)$]], title = [[^(Media viewer)$]] },
    float = true,
})

hl.window_rule({
    match = { class = [[^(discord|org\.telegram\.desktop)$]] },
    workspace = "4 silent",
})
