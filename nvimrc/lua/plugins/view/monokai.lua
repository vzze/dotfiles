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
                tag_attribute = { italic = true },
            },
            filter = "pro",

            day_night = {
                enable = false,
                day_filter = "pro",
                night_filter = "spectrum",
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
                -- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
            },-- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
            plugins = {
                bufferline = {
                    underline_selected = false,
                    underline_visible = false,
                },
                indent_blankline = {
                    context_highlight = "default", -- default | pro
                    context_start_underline = false,
                },
            },
        })


	local colors = require("monokai-pro.colorscheme")

	V.statusline.monokai = {
            normal = {
                a = { fg = colors.base.black                , bg = colors.base.yellow },
                b = { fg = colors.statusBar.white           , bg = ""                 },
                c = { fg = colors.statusBar.white           , bg = ""                 },
                x = { fg = colors.statusBar.activeForeground, bg = ""                 }
            },

            insert = {
                a = { bg = colors.base.green  , fg = colors.base.black   },
                b = { bg = ""                 , fg = colors.base.green   }
            },

            command = {
                a = { bg = colors.base.red    , fg = colors.base.black   },
                b = { bg = ""                 , fg = colors.base.red     }
            },

            visual = {
                a = { bg = colors.base.magenta, fg = colors.base.black   },
                b = { bg = ""                 , fg = colors.base.magenta }
            },

            replace = {
                a = { bg = colors.base.cyan   , fg = colors.base.black   },
                b = { bg = ""                 , fg = colors.base.cyan    }
            },

            inactive = {
                a = { fg = colors.base.yellow               , bg = "" },
                b = { fg = colors.statusBar.activeForeground, bg = "" },
                c = { fg = colors.statusBar.activeForeground, bg = "" }
            }
	}
    end
}
