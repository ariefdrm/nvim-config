return {
	-- rose pine
	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		-- enabled = false,
		config = function()
			require("rose-pine").setup({
				variant = "moon",
			})
		end,
	},

	-- nord
	{
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nord").setup({})
		end,
	},

	-- nightfox
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		-- enabled = false,
		config = function()
			require("nightfox").setup({
				options = {
					dim_inactive = true,
				},
			})
		end,
	},

	-- tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		-- enabled = false,
		opts = {},
		config = function()
			require("tokyonight").setup({
				style = "moon",
				transparent = true,
			})
		end,
	},

	-- solarized osaka
	{
		"craftzdog/solarized-osaka.nvim",
		-- enabled = false,
		priority = 1000,
		config = function()
			require("solarized-osaka").setup({
				style = "storm",
				transparent = true,
			})
		end,
	},

	-- catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false, -- Load the colorscheme immediately
		enabled = true,
		priority = 1000, -- Ensure it loads last
		config = function()
			-- Set configuration catppuccin
			require("catppuccin").setup({
				flavour = "mocha", -- Can be 'latte', 'frappe', 'macchiato', or 'mocha'
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false, -- Disable setting background
				term_colors = true, -- Set terminal colors
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
					loops = {},
					functions = { "bold" },
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
				integrations = {
					treesitter = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
					},
					lsp_trouble = true,
					cmp = true,
					gitsigns = true,
					telescope = true,
					nvimtree = {
						enabled = true,
						show_root = true,
						transparent_panel = false,
					},
					which_key = true,
					indent_blankline = {
						enabled = true,
						colored_indent_levels = false,
					},
					dashboard = true,
					neogit = true,
					vim_sneak = true,
					fern = false,
					barbar = false,
					bufferline = true,
					markdown = true,
					lightspeed = true,
					ts_rainbow = true,
					hop = true,
					notify = true,
					telekasten = true,
					symbols_outline = true,
				},
			})
		end,
	},
}
