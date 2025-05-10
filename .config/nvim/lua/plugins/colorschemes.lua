local function config(test, opts)
    opts.transparent = true

    require("tokyonight").setup(opts)
    vim.cmd.colorscheme "tokyonight"
end

return {
    "navarasu/onedark.nvim",
    {
        "scottmckendry/cyberdream.nvim",
        -- lazy = false,
        -- priority = 1000,
        config = config,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,    -- for priority to work
        priority = 1000, -- load before all other start plugins
        config = config,
        opts = { style = "moon" },
    }
}
