return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  "kana/vim-textobj-user",
	{ "kana/vim-textobj-entire", dependencies = "kana/vim-textobj-user" },
	{ "kana/vim-textobj-line", dependencies = "kana/vim-textobj-user" },
	{
		"kana/vim-textobj-indent",
		dependencies = "kana/vim-textobj-user",
	},
  {
		"ggandor/leap.nvim",
		config = function()
			require("config.leap")
		end,
		dependencies = {
			{
				"tpope/vim-repeat",
			},
		},
	},
  {
		"ggandor/flit.nvim",
		dependencies = {
			"ggandor/leap.nvim",
		},
		cofig = function()
			require("config.flit")
		end,
	},
  
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
