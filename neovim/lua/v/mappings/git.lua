V.mappings.git = {
    normal = {
        ["<leader>g"]   = { name = "+git"                                                          },
        ["<leader>gn"]  = { ":Gitsigns next_hunk<CR>"                     , "Next Hunk"            },
        ["<leader>gN"]  = { ":Gitsigns prev_hunk<CR>"                     , "Prev Hunk"            },
        ["<leader>gs"]  = { ":Gitsigns stage_buffer<CR>"                  , "Stage Buffer"         },
        ["<leader>gu"]  = { ":Gitsigns undo_stage_hunk<CR>"               , "Undo Stage Hunk"      },
        ["<leader>gr"]  = { ":Gitsigns reset_buffer<CR>"                  , "Reset Buffer"         },
        ["<leader>gp"]  = { ":Gitsigns preview_hunk<CR>"                  , "Preview Hunk"         },
        ["<leader>gb"]  = { ":Gitsigns blame_line<CR>"                    , "Blame Line"           },
        ["<leader>gB"]  = { ":Gitsigns toggle_current_line_blame<CR>"     , "Current Blame Line"   },
        ["<leader>gd"]  = { ":Gitsigns toggle_deleted<CR>"                , "Toggle Deleted"       }
    },
    visual = {},
    insert = {},
    terminal = {},
}
