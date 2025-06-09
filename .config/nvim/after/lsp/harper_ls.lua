return {
    settings = {                   -- https://writewithharper.com/docs/integrations/neovim
        ["harper-ls"] = {
            isolateEnglish = true, -- highly experimental
            fileDictPath = vim.fn.stdpath("config") .. "/spell/spell/",
            userDictPath = vim.fn.stdpath("config") .. "/spell/en.utf-8.add",
            codeActions = {
                forceStable = true             -- preserve the order of actions
            },
            diagnosticSeverity = "information" -- "hint", "information", "warning", "error"
            -- markdown = { ignore_link_title = true }
            -- linters = { -- turned off by default
            --     spelled_numbers = false, wrong_quotes = false, linking_verbs = false,
            --     boring_words = false, use_genitive = false, plural_conjugate = false,
            --     no_oxford_comma = false,
            -- }
        }
    },
}
