return {
    'lewis6991/gitsigns.nvim',
    event = "VeryLazy",
    config = function()
        require('gitsigns').setup({
            on_attach = function(bufnr)
                local wk = require("which-key")
                wk.register(V.mappings.git.normal  , { mode = "n", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })
                wk.register(V.mappings.git.visual  , { mode = "v", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })
                wk.register(V.mappings.git.insert  , { mode = "i", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })
                wk.register(V.mappings.git.terminal, { mode = "t", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })
            end,
            signs = {
                add          = { hl = 'GSDiffAdd'     , text = '+'  , numhl='GSDiffAdd'       , linehl='GSDiffAdd'     },
                change       = { hl = 'GSDiffChange'  , text = '~'  , numhl='GSDiffChange'    , linehl='GSDiffChange'  },
                delete       = { hl = 'GSDiffDelete'  , text = '_'  , numhl='GSDiffDelete'    , linehl='GSDiffDelete'  },
                topdelete    = { hl = 'GSDiffDelete'  , text = '‾'  , numhl='GSDiffDelete'    , linehl='GSDiffDelete'  },
                changedelete = { hl = 'GSDiffText'    , text = '/'  , numhl='GSDiffText'      , linehl='GSDiffText'    },
                untracked    = { hl = 'GitSignsAdd'   , text = '┆'  , numhl='GitSignsAddNr'   , linehl='GitSignsAddLn' },
            },
        })
    end
}
