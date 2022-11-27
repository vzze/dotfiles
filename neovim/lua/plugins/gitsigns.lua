return {
    'lewis6991/gitsigns.nvim',
    tag = 'release',
    config = function()
        require('gitsigns').setup({
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
