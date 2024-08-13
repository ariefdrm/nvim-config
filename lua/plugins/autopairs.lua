return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup({})
        enable_check_bracket_line = true --- check bracket in same line
        enable_bracket_in_quote = true --
        enable_afterquote = true  -- add bracket pairs after quote
    end,
}
