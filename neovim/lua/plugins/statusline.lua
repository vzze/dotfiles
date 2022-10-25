local M = {}

M.theme = function()
    local custom_theme = {
        ["normal"] = {
            ["a"] = { ["fg"] = "", ["bg"] = "" },
            ["b"] = { ["fg"] = "", ["bg"] = "" },
            ["c"] = { ["fg"] = "", ["bg"] = "" },
        },
        ["insert"] = {
            ["a"] = { ["fg"] = "", ["bg"] = "" },
            ["b"] = { ["fg"] = "", ["bg"] = "" },
            ["c"] = { ["fg"] = "", ["bg"] = "" },
        },
        ["visual"] = {
            ["a"] = { ["fg"] = "", ["bg"] = "" },
            ["b"] = { ["fg"] = "", ["bg"] = "" },
            ["c"] = { ["fg"] = "", ["bg"] = "" },
        },
        ["replace"] = {
            ["a"] = { ["fg"] = "", ["bg"] = "" },
            ["b"] = { ["fg"] = "", ["bg"] = "" },
            ["c"] = { ["fg"] = "", ["bg"] = "" },
        },
        ["command"] = {
            ["a"] = { ["fg"] = "", ["bg"] = "" },
            ["b"] = { ["fg"] = "", ["bg"] = "" },
            ["c"] = { ["fg"] = "", ["bg"] = "" },
        },
        ["inactive"] = {
            ["a"] = { ["fg"] = "", ["bg"] = "" },
            ["b"] = { ["fg"] = "", ["bg"] = "" },
            ["c"] = { ["fg"] = "", ["bg"] = "" },
        },
    }

    custom_theme.normal.a.fg = "#1f1c21"
    custom_theme.normal.a.bg = "#fcc0ff"
    custom_theme.normal.b.fg = "#fcc0ff"
    custom_theme.normal.b.bg = ""
    custom_theme.normal.c.fg = "#fcc0ff"
    custom_theme.normal.c.bg = ""

    custom_theme.insert.a.fg = "#1f1c21"
    custom_theme.insert.a.bg = "#60ff60"
    custom_theme.insert.b.fg = "#60ff60"
    custom_theme.insert.b.bg = ""
    custom_theme.insert.c.fg = "#60ff60"
    custom_theme.insert.c.bg = ""

    custom_theme.visual.a.fg = "#1f1c21"
    custom_theme.visual.a.bg = "#fa8dff"
    custom_theme.visual.b.fg = "#fa8dff"
    custom_theme.visual.b.bg = ""
    custom_theme.visual.c.fg = "#fa8dff"
    custom_theme.visual.c.bg = ""

    custom_theme.replace.a.fg = "#1f1c21"
    custom_theme.replace.a.bg = "#00fbff"
    custom_theme.replace.b.fg = "#00fbff"
    custom_theme.replace.b.bg = ""
    custom_theme.replace.c.fg = "#00fbff"
    custom_theme.replace.c.bg = ""

    custom_theme.command.a.fg = "#1f1c21"
    custom_theme.command.a.bg = "#f14c4c"
    custom_theme.command.b.fg = "#f14c4c"
    custom_theme.command.b.bg = ""
    custom_theme.command.c.fg = "#f14c4c"
    custom_theme.command.c.bg = ""

    custom_theme.inactive.a.fg = "#00fbff"
    custom_theme.inactive.a.bg = ""
    custom_theme.inactive.b.fg = "#00fbff"
    custom_theme.inactive.b.bg = ""
    custom_theme.inactive.c.fg = "#00fbff"
    custom_theme.inactive.c.bg = ""

    return custom_theme
end

M.setup = function()
    require('lualine').setup({
        options = {
            icons_enabled = false,
            theme = M.theme(),
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
                    colored = true,           -- Displays diagnostics status in color if set to true.
                    update_in_insert = true, -- Update diagnostics in insert mode.
                    always_visible = false,   -- Show diagnostics even if there are none.
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
            lualine_x = { require('auto-session-library').current_session_name },
            lualine_y = {'filesize'},
            lualine_z = {'tabs'}
        },
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    })
end

return M;
