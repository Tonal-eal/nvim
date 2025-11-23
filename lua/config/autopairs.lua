return {
  "windwp/nvim-autopairs",
  event = "InsertEnter", -- 在插入模式时加载
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- 可选：用于智能配对
    "hrsh7th/nvim-cmp", -- 可选：用于补全集成
  },
  config = function()
    local npairs = require "nvim-autopairs"
    local Rule = require "nvim-autopairs.rule"
    local cond = require "nvim-autopairs.conds"

    npairs.setup {
      -- 启用检查 Treesitter
      check_ts = true,

      -- Treesitter 配置
      ts_config = {
        lua = { "string" }, -- 不配对 lua 字符串
        javascript = { "template_string" }, -- 不配对 JS 模板字符串
        java = false, -- 不启用 java 的 Treesitter 检查
      },

      -- 禁用文件类型
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
      disable_in_macro = false, -- 在宏中禁用
      disable_in_visualblock = false, -- 在可视块模式中禁用
      disable_in_replace_mode = true, -- 在替换模式中禁用
      ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],

      -- 快速换行配置
      fast_wrap = {
        map = "<M-e>", -- 快捷键
        chars = { "{", "[", "(", '"', "'", "`" }, -- 要换行的字符
        pattern = [=[[%'%"%>%]%)%}%,]]=], -- 模式
        end_key = "$", -- 结束键
        keys = "qwertyuiopzxcvbnmasdfghjkl", -- 可用键
        check_comma = true, -- 检查逗号
        highlight = "Search", -- 高亮
        highlight_grey = "Comment", -- 灰色高亮
      },

      -- 启用检查括号行
      enable_check_bracket_line = true,

      -- 启用移动键
      enable_moveright = true,
    }

    -- 自定义规则
    -- 为 markdown 文件禁用单引号配对
    npairs.add_rules(require "nvim-autopairs.rules.endwise-lua")

    -- 智能引号配对：在空格后输入引号会自动配对
    npairs.add_rules {
      Rule(" ", " "):with_pair(function(opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({ "()", "[]", "{}" }, pair)
      end),
    }

    -- 与 nvim-cmp 集成
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    local cmp = require "cmp"
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
