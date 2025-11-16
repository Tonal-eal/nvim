return {
  "ggandor/flit.nvim",
  dependencies = { "ggandor/leap.nvim" }, -- 声明依赖 leap.nvim
  keys = { "f", "F", "t", "T" }, -- 指定触发懒加载的按键
  opts = {
    keys = { f = "f", F = "F", t = "t", T = "T" }, -- 定义插件响应的基础键位
    labeled_modes = "v", -- 在可视模式下显示标签
    multiline = true, -- 启用多行搜索
    clever_repeat = true, -- 启用智能重复，允许使用 `;` 和 `,` 重复跳转
  },
}
