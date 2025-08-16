return {
	"folke/snacks.nvim",
	enabled = true,
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = false },
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				--[[ {
					pane = 2,
					section = "terminal",
					cmd = "colorscript -e square",
					height = 5,
					padding = 1,
				}, ]]
				{ section = "keys", gap = 1, padding = 1 },
				{ pane = 2, icon = "", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ pane = 2, icon = "", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{
					pane = 2,
					icon = "",
					title = "Git Status",
					section = "terminal",
					enabled = function()
						return Snacks.git.get_root() ~= nil
					end,
					cmd = "git status --short --branch --renames",
					height = 5,
					padding = 1,
					ttl = 5 * 60,
					indent = 3,
				},
				{ section = "startup" },
			},
		},
		explorer = {
			enabled = false,
			--[[ default_keybindings = true,
			default_keybindings_opts = {
				silent = true,
			},
			auto_close = true,
			jump = { close = true }, ]]
		},
		indent = { enabled = false },
		input = { enabled = false },
		picker = { enabled = false },
		notifier = { enabled = false },
		quickfile = { enabled = false },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },
	},
	--[[ keys = {
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
	}, ]]
}
