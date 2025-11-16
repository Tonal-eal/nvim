return {
  "ggandor/leap.nvim",
  config = function()
    local leap = require "leap"
    leap.add_default_mappings() -- 添加默认映射
    -- 关键优化设置
    leap.opts.highlight_unlabeled_phase_one_targets = true -- 输入第一个字符后即高亮所有潜在目标[1](@ref)
    leap.opts.safe_labels = {} -- 禁用安全标签，所有目标从一开始就有标签，可以更快跳转[1](@ref)

    -- 定义等价字符类，将形状或功能相似的字符归为一组，提升搜索容错率[5](@ref)
    leap.opts.equivalence_classes = { " \t\r\n", "([{", ")]}", "'\"" }

    -- 设置重复键，允许使用 <Enter> 重复上一次跳转[5](@ref)
    require("leap.user").set_repeat_keys("<Enter>", "<Backspace>")
  end,
}
