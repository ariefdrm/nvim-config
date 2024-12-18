return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				-- add new null-ls.bultins.--- (if new formatter )
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.csharpier,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.clang_format.with({
					filetypes = { "c", "cpp" },
				}),
				null_ls.builtins.formatting.black,
				-- null_ls.builtins.diagnostics.eslint_d,
				-- require("none-ls.diagnostics.eslint_d"),
				require("none-ls.diagnostics.cpplint"),
			},
			-- format on save
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								bufnr = bufnr,
								filter = function(client)
									return client.name == "null-ls"
								end,
							})
						end,
					})
				end
			end,
		})

		-- keymaps for null-ls
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
