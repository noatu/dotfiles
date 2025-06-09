return {
    settings = {
        ["rust-analyzer"] = {
            cargo       = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
            },
            -- Add clippy lints for Rust.
            checkOnSave = true,
            check       = {
                -- allFeatures = true,
                command = "clippy",
                extraArgs = {
                    "--",
                    "--no-deps",                    -- run Clippy only on the given crate
                    -- Deny, Warn, Allow, Forbid
                    "-Wclippy::correctness",        -- code that is outright wrong or useless
                    "-Wclippy::complexity",         -- code that does something simple but in a complex way
                    "-Wclippy::suspicious",         -- code that is most likely wrong or useless
                    "-Wclippy::style",              -- code that should be written in a more idiomatic way
                    "-Wclippy::perf",               -- code that can be written to run faster
                    "-Wclippy::pedantic",           -- lints which are rather strict or have occasional false positives
                    "-Wclippy::nursery",            -- new lints that are still under development
                    "-Wclippy::cargo",              -- lints for the cargo manifest
                    -- Use in production
                    "-Aclippy::restriction",        -- lints which prevent the use of language and library features
                    -- Other
                    "-Aclippy::must_use_candidate", -- must_use is rather annoing
                },
            },
            procMacro   = {
                enable = true,
                -- ignored = {
                --     ["async-trait"] = { "async_trait" },
                --     ["napi-derive"] = { "napi" },
                --     ["async-recursion"] = { "async_recursion" },
                -- },
            },
        },
    }
}
