V.mappings.git = {
    normal = {
        ["\\g"]   = { name = "+git"                                                          },
        ["\\gn"]  = { "<cmd>Gitsigns next_hunk<CR>"                 , "Next Hunk"            },
        ["\\gN"]  = { "<cmd>Gitsigns prev_hunk<CR>"                 , "Prev Hunk"            },
        ["\\gs"]  = { "<cmd>Gitsigns stage_buffer<CR>"              , "Stage Buffer"         },
        ["\\gu"]  = { "<cmd>Gitsigns undo_stage_hunk<CR>"           , "Undo Stage Hunk"      },
        ["\\gr"]  = { "<cmd>Gitsigns reset_buffer<CR>"              , "Reset Buffer"         },
        ["\\gh"]  = { "<cmd>Gitsigns reset_hunk<CR>"                , "Reset Hunk"           },
        ["\\gp"]  = { "<cmd>Gitsigns preview_hunk<CR>"              , "Preview Hunk"         },
        ["\\gb"]  = { "<cmd>Gitsigns blame_line<CR>"                , "Blame Line"           },
        ["\\gB"]  = { "<cmd>Gitsigns toggle_current_line_blame<CR>" , "Current Blame Line"   },
        ["\\gd"]  = { "<cmd>Gitsigns toggle_deleted<CR>"            , "Toggle Deleted"       }
    },

    visual = {},
    insert = {},
    terminal = {},
}
