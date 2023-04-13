return {
	-- core plugins (penyedia library neovim lua)
	{ "nvim-lua/plenary.nvim", event = "VeryLazy" },
	-- color scheme
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("config.tokyonight")
			require("config.colorscheme")
		end,
	},
	-- programming
	-- coloring
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		cmd = {
			"TSBufDisable",
			"TSBufEnable",
			"TSBufToggle",
			"TSDisable",
			"TSEnable",
			"TSToggle",
			"TSInstall",
			"TSInstallInfo",
			"TSInstallSync",
			"TSModuleInfo",
			"TSUninstall",
			"TSUpdate",
			"TSUpdateSync",
		},
		build = ":TSUpdate",
		-- build = function()
		-- 	require("nvim-treesitter.install").update({ with_sync = true })()
		-- end,
		config = function()
			require("config.treesitter")
		end,
	},
	-- auto completion
	{
		"hrsh7th/nvim-cmp",
		event = "BufWinEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("config.cmp")
		end,
	},
	-- snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
      -- stylua: ignore
      keys = {
        { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
        { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
      },
	},
	-- lsp
	{
		"neovim/nvim-lspconfig",
		event = "BufWinEnter",
		config = function()
			require("config.lsp")
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
	},
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		cmd = {
			"Mason",
			"MasonInstall",
			"MasonUninstall",
			"MasonUninstallAll",
			"MasonLog",
		},
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		init = function()
			vim.tbl_map(function(plugin)
				pcall(require, plugin)
			end, { "lspconfig", "null-ls" })
		end,
	},
	-- for formater linter
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
	},
	{
		"RRethy/vim-illuminate",
		event = "VeryLazy",
	},
	{
		"jayp0521/mason-null-ls.nvim",
		dependencies = "jose-elias-alvarez/null-ls.nvim",
		event = "BufRead",
		opts = function()
			require("config.mason-null-ls")
		end,
	},
	{ "williamboman/nvim-lsp-installer", event = "VeryLazy" },
	-- auto pairs
	{
		"windwp/nvim-autopairs",
		dependencies = "hrsh7th/nvim-cmp",
		event = "VeryLazy",
		init = function()
			require("config.autopairs")
		end,
	},
}
