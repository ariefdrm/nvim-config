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
				"html", -- Html
				"cssls", -- Css
				"emmet_ls", -- emmet_ls
				"lua_ls", -- Lua
				"pyright", -- Python
				"ts_ls", -- TypeScript/JavaScript
				"clangd", -- C/C++
				"dartls", -- Dart
				"volar", -- Vue
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

				-- Custom settings for lua_ls
				if server == "lua_ls" then
					opts.settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							diagnostics = { globals = { "vim" } },
							workspace = { library = vim.api.nvim_get_runtime_file("", true) },
							telemetry = { enable = false },
						},
					}
				end

				if server == "html" then
					opts.inits_options = {
						configurationSection = { "html", "css", "javascript" },
						embeddedLanguages = {
							css = true,
							javascript = true,
							typescript = true,
						},
						provideFormatter = "prettier",
					}
					opts.filetypes = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" }
				end

				if server == "ts_ls" then
					opts.inits_options = {
						plugins = {
							{
								name = "@vue/typescript-plugin",
								location = vue_lsp,
								languages = { "vue" },
							},
						},
					}
					opts.filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
				end

				lspconfig[server].setup(opts)
			end
		end,
	},
}
