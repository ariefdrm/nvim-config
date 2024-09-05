return {
	-- night owl
	{
		"oxfist/night-owl.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			require("night-owl").setup({
				-- These are the default settings
				bold = true,
				italics = true,
				underline = true,
				undercurl = true,
				transparent_background = false,
			})
			-- set the colorscheme
			vim.cmd([[colorscheme night-owl]])
		end,
	},
	-- TokyoNight
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
				light_style = "day", -- Configure light set when use colorscheme to light
				transparent = "true", -- Enable this to disable setting the background color
				terminal = "true",
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
				},
			})
			-- set the colorscheme
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	-- Catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false, -- Load the colorscheme immediately
		priority = 0, -- Ensure it loads first
		config = function()
			--set configuration catppuccin
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
			-- Set the colorscheme
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
}
