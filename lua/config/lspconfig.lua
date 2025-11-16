return {
  "neovim/nvim-lspconfig",
  event = "User FilePost",
  config = function()
    require("nvchad.configs.lspconfig").defaults()
    local servers = { "html", "cssls" }
    vim.lsp.enable(servers)
  end,
}
