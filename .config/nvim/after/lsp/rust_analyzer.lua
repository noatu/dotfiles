return {
  cmd = { "lspmux" },
  settings = {
    ["rust-analyzer"] = {
      cargo       = {
        features = "all",
        loadOutDirsFromCheck = true,
        -- runBuildScripts = true,
      },
      -- Add clippy lints for Rust.
      checkOnSave = true,
      check       = {
        features = "all",
        command = "clippy",
        extraArgs = {
          "--",
          "--no-deps",            -- run Clippy only on the given crate
          -- Deny, Warn, Allow, Forbid
          "-Wclippy::correctness", -- code that is outright wrong or useless
          "-Wclippy::complexity", -- code that does something simple but in a complex way
          "-Wclippy::suspicious", -- code that is most likely wrong or useless
          "-Wclippy::style",      -- code that should be written in a more idiomatic way
          "-Wclippy::perf",       -- code that can be written to run faster
          "-Wclippy::pedantic",   -- lints which are rather strict or have occasional false positives
          "-Wclippy::nursery",    -- new lints that are still under development
          "-Aclippy::cargo",      -- lints for the cargo manifest
          "-Aclippy::restriction", -- lints which prevent the use of language and library features
          -- Specific
          "-Aclippy::must_use_candidate", -- must_use is rather annoing
          "-Aclippy::cognitive_complexity",
          "-Aclippy::too_many_lines",
          "-Aclippy::missing_errors_doc",
          -- "-Aclippy::from_iter_instead_of_collect", -- formats better
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
