return {
    "mason-org/mason-lspconfig.nvim",
    -- event = "BufReadPre",
    event = "User LazyFile",
    dependencies = { -- load those first
        {
            "mason-org/mason.nvim",
            opts = {
                ui = {
                    height = 0.8,
                    border = vim.g.border,
                    icons = {
                        package_pending = "󱦳",
                        package_installed = "",
                        package_uninstalled = "⤫"
                    }
                }
            }
        },
        -- {
        "neovim/nvim-lspconfig",
        -- config = function() require "configs.lspconfig" end
        -- }
    },

    opts = {
        automatic_enable = true,
        ensure_installed = {
            "lua_ls",
            "bashls",
            "tinymist",
            "rust_analyzer",
            "yamlls",
            "clangd",
            "jdtls",
            "hyprls",
            -- "sqls",
            -- "arduino_language_server",
            -- "cmake",
            --"csharp_ls", -- piece of 󰱵
            -- "hls", -- Haskell
            -- "taplo", -- toml
            -- "jsonls",
            -- "ruff_lsp", -- Python
        }
    }
}
