return {
  "CRAG666/code_runner.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("code_runner").setup {
      -- 文件类型对应的运行命令
      filetype = {
        python = "python3 -u",
        javascript = "node",
        typescript = "npx ts-node",
        java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
        c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
        cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
        rust = "cd $dir && cargo run",
        go = "go run",
      },
      -- 运行模式配置
      mode = "toggleterm", -- 可选: toggleterm, float, tab
      focus = true, -- 运行后聚焦到输出窗口
      start_in_insert = true,
    }
  end,
}
