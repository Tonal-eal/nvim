return {
  "michaelb/sniprun",
  build = "bash ./install.sh", -- 重要：编译原生组件
  config = function()
    require("sniprun").setup {
      snipruncolors = {
        SniprunVirtualTextOk = { bg = "#32302F", fg = "#D4BE98", ctermbg = "Cyan", ctermfg = "Black" },
        SniprunFloatingWinOk = { fg = "#89B482", ctermfg = "Cyan" },
        SniprunVirtualTextErr = { bg = "#EA6962", fg = "#D4BE98", ctermbg = "DarkRed", ctermfg = "Black" },
        SniprunFloatingWinErr = { fg = "#EA6962", ctermfg = "DarkRed" },
      },
    }
  end,
}
