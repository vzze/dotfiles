return {
    "loctvl842/monokai-pro.nvim",
    priority = 100,
    config = function()
        require("monokai-pro").setup({
            transparent_background = true,
            terminal_colors = false,
            devicons = false,

            styles = {
                comment = { italic = true },
                keyword = { italic = true },
                type = { italic = true },
                storageclass = { italic = true },
                structure = { italic = true },
                parameter = { italic = true },
                annotation = { italic = true },
                tag_attribute = { italic = true }
            },

            filter = "pro",

            day_night = {
                enable = false,
                day_filter = "pro",
                night_filter = "spectrum"
            },

            inc_search = "background",

            background_clear = {
                "float_win",
                "toggleterm",
                "telescope",
                "which-key",
                "renamer",
                "notify",
                -- "nvim-tree",
                "neo-tree",
                -- "bufferline"
            },

            plugins = {
                bufferline = {
                    underline_selected = false,
                    underline_visible = false
                },
                indent_blankline = {
                    context_highlight = "default", -- default | pro
                    context_start_underline = false
                }
            }
        })
    end
}
