return {
    "folke/which-key.nvim",
    event = "VeryLazy",

    config = function()
        require("which-key").setup({
            preset = "classic",
            show_help = false,

            spec = V.mappings.global,

            delay = function(_)
                return 0
            end,

            plugins = {
                marks = false,
                registers = false,

                spelling = {
                    enabled = false
                }
            },

            icons = {
                breadcrumb = ">>",
                separator = "->",
                group = "+",
                ellipsis = ".",

                mappings = false
            },

            triggers = {
                { "<auto>", mode = "nxsot" },
                { "s", mode = "n" },
                { "t", mode = "n" }
            }
        })
    end
}
