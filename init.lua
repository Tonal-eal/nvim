vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

require('config.lazy')

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

vim.cmd([[
  source ~/.config/nvim/lua/options.vim
  source ~/.config/nvim/lua/autocmds.vim
]])

vim.schedule(function()
vim.cmd([[
  source ~/.config/nvim/lua/mappings.vim
]])
end)
