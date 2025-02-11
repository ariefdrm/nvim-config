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
					-- "ts_ls",
				},
			})

			-- Mason tool installer configuration
			-- Mason-tool-installer, such for install lsp, dap, linter, and formatter
			-- I have an error when I install formatter, linter, and dap in the “ensure_installed” property “mason-lspconfig”.
			require("mason-tool-installer").setup({
				-- Ensure installed lsp, linter, formatter, dap
				ensure_installed = {
					-- Uncomment or add this section if you want install linter and formatter
					-- "prettierd",
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
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			local on_attach = function(client, bufnr)
				local opts = { buffer = bufnr, noremap = true, silent = true }

				-- Keymaps
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
			end

			local on_init = function(client, _)
				if client.supports_method("textDocument/semanticTokens") then
					client.server_capabilities.semanticTokensProvider = nil
				end
			end

			-- Lua lspconfig
			lspconfig.lua_ls.setup({
				cmd = { "lua-language-server" },
				capabilities = capabilities,
				on_attach = on_attach,
				on_init = on_init,
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
				capabilities = capabilities,
				on_attach = on_attach,
				on_init = on_init,
			})

			-- html lspconfig
			lspconfig.html.setup({
				cmd = { "vscode-html-language-server", "--stdio" },
				capabilities = capabilities,
				on_attach = on_attach,
				on_init = on_init,
				init_options = {
					configurationSection = { "html", "css", "javascript" },
					embeddedLanguages = {
						css = true,
						javascript = true,
					},
					provideFormatter = true,
				},
			})

			-- emmet_ls
			lspconfig.emmet_ls.setup({
				cmd = { "emmet-ls", "--stdio" },
				-- on_attach = on_attach,
				capabilities = capabilities,
				on_init = on_init,
				on_attach = on_attach,
				filetypes = {
					"css",
					"eruby",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"svelte",
					"pug",
					"typescriptreact",
					"vue",
				},
				init_options = {
					html = {
						options = {
							-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
							["bem.enabled"] = true,
						},
					},
				},
			})

			-- javascript / typescript lspconfig
			lspconfig.ts_ls.setup({
				cmd = { "typescript-language-server", "--stdio" },
				capabilities = capabilities,
				on_attach = on_attach,
				on_init = on_init,
			})

			-- C# lspconfig
			lspconfig.csharp_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				on_init = on_init,
			})

			-- css lspconfig
			lspconfig.cssls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				on_init = on_init,
			})

			-- Python lspconfig
			lspconfig.pyright.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				on_init = on_init,
			})
		end,
	},
}
