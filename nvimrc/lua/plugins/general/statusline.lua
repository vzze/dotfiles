return {
    'nvim-lualine/lualine.nvim',
    config = function()
        local git_status = function()
            if vim.b.gitsigns_status ~= '' then
                return vim.b.gitsigns_head .. ': ' .. vim.b.gitsigns_status
            end
            if vim.b.gitsigns_head then
                return vim.b.gitsigns_head
            end
            return ''
        end

        require('lualine').setup({
            options = {
                icons_enabled = false,
                theme = _G.V.lualine.theme,
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
                    tabline = 1000
                }
            },
            tabline = {
                lualine_a = { 'mode', git_status, 'searchcount' },
                lualine_b = { 'tabs' },
                lualine_c = { 'buffers' },
                lualine_x = {
                    {
                        'diagnostics',

                        sources = { 'nvim_diagnostic', 'coc' },
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
                lualine_y = {
                    {
                        require("lazy.status").updates,
                        cond = require("lazy.status").has_updates
                    },
                    'filename', 'encoding', 'filesize', 'progress'
                },
                lualine_z = { 'location' }
            },
            sections = {
                lualine_a = { 'filename' },
                lualine_b = { '' },
                lualine_c = { '' },
                lualine_x = { '' },
                lualine_y = { '' },
                lualine_z = { '' },
            },
            inactive_sections = {
                lualine_a = { 'filename' },
                lualine_b = { '' },
                lualine_c = { '' },
                lualine_x = { '' },
                lualine_y = { '' },
                lualine_z = { '' },
            },
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        })

        require('lualine').hide({
            place = {'winbar'},
            unhide = false
        })

        vim.api.nvim_command([[set laststatus=1]])
    end
}
