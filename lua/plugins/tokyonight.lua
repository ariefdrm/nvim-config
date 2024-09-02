return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 0,
	config = function()
		require("tokyonight").setup({
			opts = {
				transparent = true, -- Enable this to disable setting the background color
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = true },
					keywords = { italic = true },
					functions = {},
					variables = {},
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "dark", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
			},
		})
		-- set the colorscheme
		vim.cmd([[colorscheme tokyonight-storm]])
	end,
}
