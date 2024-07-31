return {
    'folke/which-key.nvim',
    event = "VeryLazy",
    config = function()
        local wk = require("which-key")

        wk.setup({
            spec = V.mappings.global,

            plugins = { marks = false, registers = false },

            icons = {
                breadcrumb = ">>",
                separator = "->",
                group = "+",
                ellipsis = ".",
                mappings = false
            },

            show_help = false,

            triggers = {
                { "<auto>", mode = "nxsot" },
                { "s", mode = "n" },
                { "t", mode = "n" }
            }
        })
    end
}
