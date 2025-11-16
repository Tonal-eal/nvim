return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require "conform"

    conform.setup {
      -- 1. 定义不同文件类型对应的格式化工具
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" }, -- 将按顺序执行多个格式化工具
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        rust = { "rustfmt", lsp_format = "fallback" },
        json = { "jq" },
        yaml = { "yamlfmt" },
        -- 如果多个格式化工具都可用，'stop_after_first' 选项可以让 Conform 在找到一个可用的后即停止，避免重复执行
        markdown = { { "prettierd", "markdownlint" }, stop_after_first = true },
        c = { "clang_format" },
        cpp = { "clang_format" },
      },

      -- 2. 配置格式化选项（可选）
      format = {
        timeout_ms = 3000, -- 设置格式化超时时间（毫秒）
        async = false, -- 是否异步格式化（不建议设置为true，可能导致保存时格式化未完成）
        lsp_fallback = true, -- 如果配置的格式化器失败或不可用，是否回退到LSP的格式化功能
      },

      -- 3. （推荐）设置为保存文件时自动格式化
      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,
      },
    }

    -- 5. 创建一个手动格式化的快捷键
    vim.keymap.set({ "n", "v" }, "<leader><leader>", function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      }
    end, { desc = "[C]ode [F]ormat" })
  end,
}
