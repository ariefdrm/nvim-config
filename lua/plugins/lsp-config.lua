---@diagnostic disable: unused-local
-- Lsp server config
return {
	{
		-- Mason nvim
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim", -- Mason lsp config
			"WhoIsSethDaniel/mason-tool-installer.nvim", -- Mason tool installer
		},
		config = function()
			-- Mason configuration
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
					-- uncomment or add this section if you want install language server
					"lua_ls",
					-- "clangd",
					-- "html",
					-- "cssls",
					-- "emmet_ls",
					-- "ts_ls",
					-- "pyright",
				},
			})

			-- Mason tool installer configuration
			-- Mason-tool-installer, such for install lsp, dap, linter, and formatter
			-- I have an error when I install formatter, linter, and dap in the “ensure_installed” property “mason-lspconfig”.
			require("mason-tool-installer").setup({
				-- Ensure installed lsp, linter, formatter, dap
				ensure_installed = {
					-- Uncomment or add this section if you want install linter and formatter
					-- "prettier",
					-- "codelldb",
					-- "cpplint",
					-- "clang-format",
					"stylua",
					-- "csharpier",
					-- "eslint_d",
				},
			})
		end,
	},

	-- Nvim lsp config
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			-- List of LSP servers
			local servers = {
				"cssls", -- Css
				"emmet_ls", -- emmet_ls
				"pyright", -- Python
				"clangd", -- C/C++
				"dartls", -- Dart
				"volar", -- Vue
				"intelephense", -- PHP
				-- "phpactor",
			}

			-- LSP keybindings and on_attach function
			local on_attach = function(client, bufnr)
				local keymap = vim.keymap.set
				local opts = { buffer = bufnr, silent = true }

				keymap("n", "gD", vim.lsp.buf.declaration, opts)
				keymap("n", "gd", vim.lsp.buf.definition, opts)
				keymap("n", "K", vim.lsp.buf.hover, opts)
				keymap("n", "gi", vim.lsp.buf.implementation, opts)
				keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				keymap("n", "<leader>D", vim.lsp.buf.type_definition, opts)
				keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
				keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				keymap("n", "gr", vim.lsp.buf.references, opts)
				keymap("n", "gl", vim.diagnostic.open_float, opts)
				keymap("n", "<leader>dl", vim.diagnostic.setloclist, opts)
			end

			-- Extend capabilities with nvim-cmp
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- for vue lsp
			local mason_registry = require("mason-registry")
			local vue_lsp = mason_registry.get_package("vue-language-server"):get_install_path()
				.. "/node_modules/@vue/language-server"

			-- Loop over each server to set up LSP configurations
			for _, server in ipairs(servers) do
				local opts = {
					on_attach = on_attach,
					capabilities = capabilities,
				}

				lspconfig[server].setup(opts)
			end

			-- Custom settings for lsp server
			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = { library = vim.api.nvim_get_runtime_file("", true) },
						telemetry = { enable = false },
					},
				},
			})

			lspconfig.html.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				inits_options = {
					configurationSection = { "html", "css", "javascript" },
					embeddedLanguages = {
						css = true,
						javascript = true,
					},
					provideFormatter = "prettier",
				},
				filetypes = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
			})

			lspconfig.ts_ls.setup({
				inits_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vue_lsp,
							languages = { "vue" },
						},
					},
				},
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
			})
		end,
	},

	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
		config = function()
			require("typescript-tools").setup({
				on_attach = on_attach,
				filetypes = {
					"javascript",
					"typescript",
					"vue",
				},
				settings = {
					single_file_support = false,
					tsserver_plugins = {
						"@vue/typescript-plugin",
					},
				},
			})
		end,
	},
}
