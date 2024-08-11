return {
     "folke/tokyonight.nvim",
      lazy = false,
      priority = 100,
      opts = {},
        config = function()
            vim.cmd[[colorscheme tokyonight]]
        end
}
