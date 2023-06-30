V.mappings.git = {
    normal = {
        ["<leader>g"]   = { name = "+git"                                                          },
        ["<leader>gn"]  = { "<cmd>Gitsigns next_hunk<CR>"                 , "Next Hunk"            },
        ["<leader>gN"]  = { "<cmd>Gitsigns prev_hunk<CR>"                 , "Prev Hunk"            },
        ["<leader>gs"]  = { "<cmd>Gitsigns stage_buffer<CR>"              , "Stage Buffer"         },
        ["<leader>gu"]  = { "<cmd>Gitsigns undo_stage_hunk<CR>"           , "Undo Stage Hunk"      },
        ["<leader>gr"]  = { "<cmd>Gitsigns reset_buffer<CR>"              , "Reset Buffer"         },
        ["<leader>gh"]  = { "<cmd>Gitsigns reset_hunk<CR>"                , "Reset Hunk"           },
        ["<leader>gp"]  = { "<cmd>Gitsigns preview_hunk<CR>"              , "Preview Hunk"         },
        ["<leader>gb"]  = { "<cmd>Gitsigns blame_line<CR>"                , "Blame Line"           },
        ["<leader>gB"]  = { "<cmd>Gitsigns toggle_current_line_blame<CR>" , "Current Blame Line"   },
        ["<leader>gd"]  = { "<cmd>Gitsigns toggle_deleted<CR>"            , "Toggle Deleted"       }
    },
    visual = {},
    insert = {},
    terminal = {},
}
