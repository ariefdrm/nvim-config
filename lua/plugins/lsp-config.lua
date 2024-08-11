return {
    -- mason nvim
	{
		"williamboman/mason.nvim", -- Mason nvim
        lazy = false,
		config = function()
			require('mason').setup()
		end 
	},
    -- Mason lsp config
	{
		 "williamboman/mason-lspconfig.nvim",	
        lazy = false,
		config = function()
        require("mason-lspconfig").setup {
            ensure_installed = { "lua_ls" },
        }
		end	
	},
    -- Nvim lsp config
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
               capabilities = capabilities,            
            })
            
            -- keymaps 
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set({'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        end
    },
}
