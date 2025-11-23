vim.g["surround_no_mappings"] = 1
-- Just the defaults copied here.
vim.keymap.set("n", "ds", "<Plug>Dsurround")
vim.keymap.set("n", "cs", "<Plug>Csurround")
vim.keymap.set("n", "cS", "<Plug>CSurround")
vim.keymap.set("n", "ys", "<Plug>Ysurround")
vim.keymap.set("n", "yS", "<Plug>YSurround")
vim.keymap.set("n", "yss", "<Plug>Yssurround")
vim.keymap.set("n", "ySs", "<Plug>YSsurround")
vim.keymap.set("n", "ySS", "<Plug>YSsurround")

vim.keymap.set("x", "gs", "<Plug>VSurround")
vim.keymap.set("x", "gS", "<Plug>VgSurround")
return {
  "kylechui/nvim-surround",
  version = "*", -- 使用最新稳定版
  event = "VeryLazy", -- 延迟加载
  config = function()
    require("nvim-surround").setup {
      -- 详细配置见下文
    }
  end,
}
