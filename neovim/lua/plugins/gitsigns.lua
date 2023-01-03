return {
    'lewis6991/gitsigns.nvim',
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
                add          = { hl = 'DiffAdd'       , text = '+'  , numhl='DiffAdd'         , linehl='DiffAdd'       },
                change       = { hl = 'DiffChange'    , text = '~'  , numhl='DiffChange'      , linehl='DiffChange'    },
                delete       = { hl = 'DiffDelete'    , text = '_'  , numhl='DiffDelete'      , linehl='DiffDelete'    },
                topdelete    = { hl = 'DiffDelete'    , text = '‾'  , numhl='DiffDelete'      , linehl='DiffDelete'    },
                changedelete = { hl = 'DiffText'      , text = '/'  , numhl='DiffText'        , linehl='DiffText'      },
                untracked    = { hl = 'GitSignsAdd'   , text = '┆'  , numhl='GitSignsAddNr'   , linehl='GitSignsAddLn' },
            },
        })
    end
}
