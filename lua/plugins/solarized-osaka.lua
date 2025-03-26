return {
	"craftzdog/solarized-osaka.nvim",
	-- enabled = false,
	priority = 1000,
	config = function()
		require("solarized-osaka").setup({
			style = "storm",
			transparent = true,
		})
	end,
}
