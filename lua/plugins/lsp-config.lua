-- Lsp server config
return {
	{
		-- Mason nvim
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim", -- mason lsp config
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		lazy = lazy,
		config = function()
			-- mason configuration
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			-- Mason-lspconfig configuration
			require("mason-lspconfig").setup({
				-- Ensure install for language server
				ensure_installed = {
					"lua_ls",
					"clangd",
					"tsserver",
					"html",
					"cssls",
					"csharp_ls",
					"omnisharp",
				},
			})

			-- Mason tool installer configuration
			-- Mason-tool-installer, such for install lsp, dap, linter, and formatter
			-- I have an error when I install formatter, linter, and dap in the “ensure_installed” property “mason-lspconfig”.
			require("mason-tool-installer").setup({
				-- Ensure installed lsp, linter, formatter, dap
				ensure_installed = {
					"prettierd",
					"codelldb",
					"cpplint",
					"clang-format",
					"stylua",
					"htmlbeautifier",
					"csharpier",
					"eslint_d",
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

			-- C/C++ lspconfig
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
			lspconfig.omnisharp.setup({
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
