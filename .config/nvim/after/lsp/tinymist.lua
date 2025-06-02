-- https://myriad-dreamin.github.io/tinymist//frontend/neovim.html
vim.lsp.config('tinymist', {
    settings = {
        formatterPrintWidth = 100,  -- can't stand 120
        formatterMode = "typstyle", -- or typstfmt
        exportPdf = "onSave",       -- "onDocumentHasTitle", -- default: never
        semanticTokens = "enable",
    },
    single_file_support = true,
    root_dir = function(bufnr, callback)
        callback(vim.fs.root(bufnr, { ".git" }) or vim.fn.expand "%:p:h")
    end,
})
