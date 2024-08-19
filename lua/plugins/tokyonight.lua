return {
     "folke/tokyonight.nvim",
      lazy = true,
      priority = 0,
      opts = {},
        config = function()
            vim.cmd[[colorscheme tokyonight]]
        end
}
