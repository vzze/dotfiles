return {
    "loctvl842/monokai-pro.nvim",
    priority = 0,

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
            },

            override_palette = function(_ --[[filter]])
                return {
                    dark2 = "#1c1c21",
                    dark1 = "#211c20",
                    background = "#1f1c21",
                    text = "#ffffff",
                    accent1 = "#fcc0ff",
                    accent2 = "#c0e3ff",
                    accent3 = "#ff4f5f",
                    accent4 = "#87ffaf",
                    accent5 = "#91fdff",
                    accent6 = "#c16fff",
                    dimmed1 = "#edd5ff",
                    dimmed2 = "#edd5ff",
                    dimmed3 = "#877a91",
                    dimmed4 = "#877a91",
                    dimmed5 = "#2a262d"
                }
            end,
        })
    end
}
