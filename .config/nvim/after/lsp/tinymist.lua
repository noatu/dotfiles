-- https://myriad-dreamin.github.io/tinymist//frontend/neovim.html
vim.lsp.config('tinymist', {
    settings = {
        formatterPrintWidth = 100,  -- can't stand 120
        formatterMode = "typstyle", -- or typstfmt
        -- exportPdf = "onDocumentHasTitle", -- default: never
        semanticTokens = "enable"
    },
    single_file_support = true,
    -- root_dir = function(_, bufnr)
    --     return vim.fs.root(bufnr, { ".git" }) or vim.fn.expand "%:p:h"
    -- end,
})

