local M = {}

M.theme = {
    ["normal"] = {
        ["a"] = { ["fg"] = "#1f1c21", ["bg"] = "#fcc0ff" },
        ["b"] = { ["fg"] = "fcc0ff", ["bg"] = ""         },
        ["c"] = { ["fg"] = "fcc0ff", ["bg"] = ""         },
    },
    ["insert"] = {
        ["a"] = { ["fg"] = "#1f1c21", ["bg"] = "#60ff60" },
        ["b"] = { ["fg"] = "#60ff60", ["bg"] = "" },
        ["c"] = { ["fg"] = "#60ff60", ["bg"] = "" },
    },
    ["visual"] = {
        ["a"] = { ["fg"] = "#1f1c21", ["bg"] = "#fa8dff" },
        ["b"] = { ["fg"] = "#fa8dff", ["bg"] = "" },
        ["c"] = { ["fg"] = "#fa8dff", ["bg"] = "" },
    },
    ["replace"] = {
        ["a"] = { ["fg"] = "#1f1c21", ["bg"] = "#00fbff" },
        ["b"] = { ["fg"] = "#00fbff", ["bg"] = "" },
        ["c"] = { ["fg"] = "#00fbff", ["bg"] = "" },
    },
    ["command"] = {
        ["a"] = { ["fg"] = "#1f1c21", ["bg"] = "#f14c4c" },
        ["b"] = { ["fg"] = "#f14c4c", ["bg"] = "" },
        ["c"] = { ["fg"] = "#f14c4c", ["bg"] = "" },
    },
    ["inactive"] = {
        ["a"] = { ["fg"] = "#00fbff", ["bg"] = "" },
        ["b"] = { ["fg"] = "#00fbff", ["bg"] = "" },
        ["c"] = { ["fg"] = "#00fbff", ["bg"] = "" },
    },
}

M.setup = function()
    require('lualine').setup({
        options = {
            icons_enabled = false,
            theme = M.theme,
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            disabled_filetypes = {
                statusline = {},
                winbar = {}
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000
            }
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {
                'branch', 'diff',
                {
                    'diagnostics',

                    sources = { 'coc' },
                    sections = { 'error', 'warn', 'info', 'hint' },

                    diagnostics_color = {
                        error = 'DiagnosticError',
                        warn  = 'DiagnosticWarn',
                        info  = 'DiagnosticInfo',
                        hint  = 'DiagnosticHint',
                    },
                    symbols = {error = 'E:', warn = 'W:', info = 'I:', hint = 'H:'},
                    colored = true,
                    update_in_insert = true,
                    always_visible = false,
                }
            },
            lualine_c = {'filename'},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {
            lualine_a = {'buffers'},
            lualine_b = {'filename'},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {'filesize'},
            lualine_z = {'tabs'}
        },
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    })
end

return M;
