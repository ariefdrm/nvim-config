return {
	-- lsp server config
	{
		"williamboman/mason.nvim", -- Mason nvim
		dependencies = {
			"williamboman/mason-lspconfig.nvim", -- mason lsp config
		},
		lazy = lazy,
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
			require("mason-lspconfig").setup({
				-- ensure install language server
				ensure_installed = {
					"lua_ls",
					"clangd",
					"tsserver",
					"html",
					"omnisharp",
					"cssls",
				},
			})
		end,
	},

	-- Nvim lsp config
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- lua lspconfig
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			-- c/c++ lspconfig
			lspconfig.clangd.setup({
				cmd = { "clangd" },
				filetypes = { "c", "cpp", "objc", "objcpp" },
				root_pattern = {
					".clangd",
					".clang-tidy",
					".clang-format",
					"compile_commands.json",
					"compile_flags.txt",
					"configure.ac",
					".git",
				},
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			-- html lspconfig
			lspconfig.html.setup({
				capabilities = capabilities,
			})

			-- javascript / typescript lspconfig
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})

			-- C# lspconfig
			lspconfig.csharp_ls.setup({
				capabilities = capabilities,
			})

			-- css lspconfig
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})

			-- keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		end,
	},
}
