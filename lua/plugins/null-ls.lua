return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
                -- add new null-ls.bultins.--- (if new language)
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.completion.spell,
			},
		})

		-- keymaps for null-ls
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
