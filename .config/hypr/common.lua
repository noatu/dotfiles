local M = {}

M.mod = "SUPER"

-- The colemak home row and the arrows, pointing the same way.
M.dirs = {
    N = "left", E = "down", I = "up", O = "right",
    left = "left", down = "down", up = "up", right = "right",
}

function M.exec(keys, cmd, opts) hl.bind(keys, hl.dsp.exec_cmd(cmd), opts) end

-- For submaps that stay open: run the dispatcher, then drop back to the global map.
function M.then_reset(keys, dispatcher)
    hl.bind(keys, function()
        hl.dispatch(dispatcher)
        hl.dispatch(hl.dsp.submap("reset"))
    end)
end

-- Keys that leave a submap without doing anything.
function M.leave_keys(entry)
    hl.bind(entry, hl.dsp.no_op())
    hl.bind("Space", hl.dsp.no_op())
    hl.bind("Return", hl.dsp.no_op())
    hl.bind("Escape", hl.dsp.no_op())
end

return M
