function lsp_config()
  local navic = require "nvim-navic"
  local function on_attach(client, bufnr)
    navic.attach(client, bufnr)
  end

  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  local opts = {
    noremap = true,
    silent = true,
    -- 确保自动安装以下 LSP 服务器
    ensure_installed = {
      "lua_ls", -- Lua
      "clangd", -- C/C++
      "pyright", -- Python
      "tsgo", -- TypeScript/JavaScript
      "rust_analyzer", -- Rust
      "jsonls", -- JSON
      "yamlls", -- YAML
      -- 可根据需要添加其他服务器，如 "jdtls"（Java）、"html"，"cssls" 等 [1,6](@ref)
    },

    -- 是否自动安装 ensure_installed 列表中未安装的 LSP 服务器
    automatic_installation = true,

    -- （可选）自动启用已安装的 LSP 服务器 [1](@ref)
    -- 默认情况下，插件会自动启用所有通过 Mason 安装的 LSP 服务器。
    -- 你可以通过以下方式进行精细化控制：
    -- automatic_enable = true, -- 启用所有（默认行为）
    -- automatic_enable = { "lua_ls", "pyright" }, -- 仅启用指定服务器
    -- automatic_enable = false, -- 完全禁用自动启用，全部手动配置
    handler = {
      function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
          capabilities = capabilities, --cmpを連携⇐ココ！
          on_attach = on_attach,
        }
      end,
      -- ["rust_analyzer"] = function()
      -- end,
      ["clangd"] = function()
        capabilities.offsetEncoding = { "utf-16" }
        require("lspconfig").clangd.setup {
          capabilities = capabilities,
          on_attach = on_attach,
        }
      end,
      ["pyright"] = function()
        require("lspconfig").pyright.setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = {
            pyright = { autoImportCompletion = true },
            python = {
              venvPath = ".",
              -- pythonPath = "./.venv/bin/python",
              analysis = {
                extraPaths = { "." },
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "off",
              },
            },
          },
        }
      end,
    },
  }
  require("mason-lspconfig").setup(opts)
end

return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = { noremap = true, silent = true },
  config = lsp_config,
}
