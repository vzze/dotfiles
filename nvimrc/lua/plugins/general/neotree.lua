return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",

    opts = {
        enable_diagnostics = true,
        enable_git_status = true,

        filesystem = {
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = false
            }
        },

        default_component_configs = {
            diagnostics = {
                symbols = {
                    hint = "H",
                    info = "I",
                    warn = "W",
                    error = "X"
                },

                highlights = {
                    hint = "DiagnosticSignHint",
                    info = "DiagnosticSignInfo",
                    warn = "DiagnosticSignWarn",
                    error = "DiagnosticSignError"
                }
            },

            indent = {
                indent_marker = " ",
                last_indent_marker = " ",
                with_expanders = nil,
                expander_collapsed = "+",
                expander_expanded = "V"
            },

            icon = {
                folder_closed = "=",
                folder_open = "o",
                folder_empty = "e",
                default = "-",
            },

            git_status = {
                symbols = {
                    added     = "+",
                    modified  = "~",
                    deleted   = "_",
                    renamed   = "r",
                    untracked = "t",
                    ignored   = "i",
                    unstaged  = "u",
                    staged    = "s",
                    conflict  = "c"
                }
            }
        }
    }
}
