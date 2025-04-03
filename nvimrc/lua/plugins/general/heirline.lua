return {
    "rebelot/heirline.nvim",

    config = function()
        local heirline = require("heirline")
        local heircomps = require("heirline-components.all")

        heircomps.init.subscribe_to_events()

        local set_2_none = {
            winbarnc_bg = "NONE",
            winbar_bg = "NONE",
            section_bg = "NONE",
            macro_recording_bg = "NONE",
            bg = "NONE",
            cmd_info_bg = "NONE",
            mode_bg = "NONE",
            git_branch_bg = "NONE",
            file_info_bg = "NONE",
            git_diff_bg = "NONE",
            diagnostics_bg = "NONE",
            treesitter_bg = "NONE",
            tabline_bg = "NONE",
            lsp_bg = "NONE",
            virtual_env_bg = "NONE",
            nav_bg = "NONE",
            tab_active_bg = "NONE",
            tab_bg = "NONE",
            tab_close_bg = "NONE",
            buffer_overflow_bg = "NONE",
            buffer_visible_bg = "NONE",
            buffer_active_bg = "NONE",
            buffer_bg = "NONE",
        }

        local update_custom_tabline = vim.schedule_wrap(function()
            vim.cmd.redrawtabline()
        end)

        vim.api.nvim_create_augroup("Heirline", { clear = true })

        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                heirline.load_colors(set_2_none)

                vim.api.nvim_set_hl(0, "TabLineFill" , { bg = "NONE"              })
                vim.api.nvim_set_hl(0, "StatusLine"  , { bg = "NONE", bold = true })
                vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE"              })
            end,

            group = "Heirline"
        })

        heirline.setup({
            tabline = {
                heircomps.component.mode({
                    update = {
                        "ModeChanged",
                        pattern = "*:*",
                        callback = update_custom_tabline
                    }
                }),

                heircomps.component.tabline_tabpages(),

                heircomps.component.tabline_buffers({
                    file_icon = false,
                    close_button = false
                }),

                heircomps.component.fill(),

                heircomps.component.git_diff   ({ update = false }),
                heircomps.component.git_branch ({ update = false }),
                heircomps.component.diagnostics({ update = false }),

                heircomps.component.lsp({
                    lsp_progress = {
                        str = "",
                        padding = { right = 1, left = 0 },

                        update = {
                            "User",
                            pattern = { "HeirlineComponentsUpdateLspProgress" },
                            callback = update_custom_tabline
                        },

                        init = require("heirline-components.core.init").lsp_progress()
                    },

                    lsp_client_names = {
                        str = "LSP",

                        update = {
                            "LspAttach",
                            "LspDetach",
                            "BufEnter",
                            "VimResized",
                            callback = update_custom_tabline
                        },

                        icon = { kind = "ActiveLSP", padding = { right = 1 } }
                    }
                }),

                heircomps.component.treesitter({ update = false }),

                heircomps.component.cmd_info({
                    macro_recording = {
                        update = {
                            "RecordingEnter",
                            "RecordingLeave",
                            callback = update_custom_tabline
                        },
                    },
                }),

                heircomps.component.nav({ update = false })
            },

            statusline = {
                heircomps.component.file_info({ filename = {}, filetype = false }),
                heircomps.component.fill(),
            }
        })

        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "BufEnter", "DiagnosticChanged" }, {
            callback = update_custom_tabline
        })

        vim.api.nvim_create_autocmd("User", {
            pattern = "GitSignsUpdate",
            callback = update_custom_tabline
        })

        vim.api.nvim_create_autocmd("OptionSet", {
            pattern = "syntax",
            callback = update_custom_tabline
        })
    end
}
