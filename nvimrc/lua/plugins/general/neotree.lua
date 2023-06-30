return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    event = "VeryLazy",
    config = function()
        vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

        require("neo-tree").setup({
            enable_git_status = true,
            enable_diagnostics = true,
            default_component_configs = {
                diagnostics = {
                    symbols = {
                        hint = "H",
                        info = "I",
                        warn = "!",
                        error = "X",
                    },
                    highlights = {
                        hint = "DiagnosticSignHint",
                        info = "DiagnosticSignInfo",
                        warn = "DiagnosticSignWarn",
                        error = "DiagnosticSignError",
                    },
                },
                indent = {
                    indent_marker = " ",
                    last_indent_marker = " ",
                    with_expanders = nil,
                    expander_collapsed = "+",
                    expander_expanded = "V",
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
                        conflict  = "c",
                    }
                },
            }
        })
    end
}
