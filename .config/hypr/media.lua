local M = {}

local SINK   = "@DEFAULT_AUDIO_SINK@"
local SOURCE = "@DEFAULT_AUDIO_SOURCE@"

-- Waybar has no event for mic mute, so poke it to redraw (SIGRTMIN+1).
local waybar_poke = " ; killall waybar -s 35"

local function sign(n) return n < 0 and "-" or "+" end

function M.sink(pct)
    return ("wpctl set-volume -l 1.5 %s %d%%%s"):format(SINK, math.abs(pct), sign(pct))
end

-- playerctl works in 0.0-1.0, everything else here in percent; keep the call sites uniform.
function M.player(pct)
    return ("playerctl volume %g%s"):format(math.abs(pct) / 100, sign(pct))
end

function M.backlight(pct)
    return ("brightnessctl s %d%%%s"):format(math.abs(pct), sign(pct))
end

-- External monitor brightness over DDC/CI; -b 10 is the i2c bus of DP-6.
function M.ddc(pct)
    return ("ddcutil -b 10 --noverify --skip-ddc-checks setvcp 10 %s %d"):format(sign(pct), math.abs(pct))
end

M.sink_mute   = ("wpctl set-mute %s 1"):format(SINK)
M.sink_unmute = ("wpctl set-mute %s 0"):format(SINK)

M.mic_mute   = ("wpctl set-mute %s 1"):format(SOURCE) .. waybar_poke
M.mic_unmute = ("wpctl set-mute %s 0"):format(SOURCE) .. waybar_poke
M.mic_toggle = ("wpctl set-mute %s toggle"):format(SOURCE) .. waybar_poke

M.play_pause     = "playerctl play-pause"
M.play_pause_all = "playerctl -a play-pause"
M.prev           = "playerctl previous"
M.next           = "playerctl next"

M.wifi_off = "nmcli radio wifi off"
M.wifi_on  = "nmcli radio wifi on"
M.bt_off   = "bluetoothctl power off"
M.bt_on    = "bluetoothctl power on"

return M
