return {
  "kevinhwang91/nvim-hlslens",
  event = "VeryLazy",
  dependencies = {
    "petertriho/nvim-scrollbar", -- 可选：在滚动条上显示搜索结果
  },
  config = function()
    local hlslens = require "hlslens"
    hlslens.setup {
      -- 视觉配置
      build_position_cb = function(plist, _, _, _)
        require("scrollbar.handlers.search").handler.show(plist.start_pos)
      end,

      -- 浮动窗口配置
      float_shadow_blend = 50, -- 浮动窗口阴影混合度
      enable_float_win = true, -- 启用浮动窗口显示
      float_opts = {
        border = "rounded", -- 浮动窗口边框样式
        title = "Search Results", -- 浮动窗口标题
        col = 0, -- 列位置
        height = 10, -- 高度
        width = 60, -- 宽度
        line = 0, -- 行位置
      },

      -- 性能配置
      calm_down = true, -- 减少连续输入时的刷新频率
      nearest_only = true, -- 显示所有匹配项
      nearest_float_when = "always", -- 总是显示最近的匹配项浮动窗口
    }

    -- 增强搜索体验的按键映射
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    -- 在搜索模式下自动启用 hlslens
    keymap.set("n", "n", "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>", opts)
    keymap.set("n", "N", "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>", opts)
    keymap.set("n", "*", "*<Cmd>lua require('hlslens').start()<CR>", opts)
    keymap.set("n", "#", "#<Cmd>lua require('hlslens').start()<CR>", opts)
    keymap.set("n", "g*", "g*<Cmd>lua require('hlslens').start()<CR>", opts)
    keymap.set("n", "g#", "g#<Cmd>lua require('hlslens').start()<CR>", opts)
  end,
}
