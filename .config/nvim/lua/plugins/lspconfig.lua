return {
  "neovim/nvim-lspconfig",
  event = "User LazyFile",
  config = function()
    local enabled = {
      "lua_ls",
      "bashls",
      "tinymist",
      "rust_analyzer",
      "yamlls",
      "clangd",
      "jdtls",
      "hyprls",
    }
    for _, name in ipairs(enabled) do
      vim.lsp.enable(name)
    end
  end

}
