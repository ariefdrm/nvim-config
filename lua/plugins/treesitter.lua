return {
    "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")

        config.setup({
            auto_install = true,
            sync_install = false,
            -- highlighting 
            highlight = {
              enable = true,
            },
            -- Indent
            indent = { enable = true },
        })
    end 

}



