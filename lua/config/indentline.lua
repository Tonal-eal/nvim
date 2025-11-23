return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" }, -- 在文件读取时加载
  config = function()
    -- vim.cmd [[ let g:ibl.config.indent.char = '¦' ]]
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }

    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)
    require("ibl").setup {
      -- for example, context is off by default, use this to turn it on
      indent = { char = "¦", highlight = highlight },
      scope = {
        show_start = false,
        show_end = false,
        show_exact_scope = true, -- 精确显示范围
        injected_languages = true, -- 支持注入语言
        priority = 500, -- 优先级
      },
      exclude = {
        filetypes = {
          "lspinfo",
          "packer",
          "checkhealth",
          "help",
          "man",
          "gitcommit",
          "TelescopePrompt",
          "TelescopeResults",
          "neo-tree",
          "dashboard",
          "lazy",
          "mason",
          "",
        },
        buftypes = {
          "terminal",
          "nofile",
          "quickfix",
          "prompt",
        },
      },

      -- 空白字符配置
      whitespace = {
        remove_blankline_trail = true, -- 移除行尾空白
      },
    }
  end,
}
