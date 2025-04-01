V.mappings.git = function(buf)
    return {
        { "<LocalLeader>g" , group = "git", buffer = buf },

        { "<LocalLeader>gn", "<cmd>Gitsigns next_hunk<CR>"                , desc = "Next Hunk"         , buffer = buf },
        { "<LocalLeader>gN", "<cmd>Gitsigns prev_hunk<CR>"                , desc = "Prev Hunk"         , buffer = buf },
        { "<LocalLeader>gs", "<cmd>Gitsigns stage_buffer<CR>"             , desc = "Stage Buffer"      , buffer = buf },
        { "<LocalLeader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>"          , desc = "Undo Stage Hunk"   , buffer = buf },
        { "<LocalLeader>gr", "<cmd>Gitsigns reset_buffer<CR>"             , desc = "Reset Buffer"      , buffer = buf },
        { "<LocalLeader>gh", "<cmd>Gitsigns reset_hunk<CR>"               , desc = "Reset Hunk"        , buffer = buf },
        { "<LocalLeader>gp", "<cmd>Gitsigns preview_hunk<CR>"             , desc = "Preview Hunk"      , buffer = buf },
        { "<LocalLeader>gb", "<cmd>Gitsigns blame_line<CR>"               , desc = "Blame Line"        , buffer = buf },
        { "<LocalLeader>gB", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Current Blame Line", buffer = buf },
        { "<LocalLeader>gd", "<cmd>Gitsigns toggle_deleted<CR>"           , desc = "Toggle Deleted"    , buffer = buf },

        { "<Leader>gl"     , "<cmd>Telescope git_branches<CR>"            , desc = "Git Branches"      , buffer = buf },
        { "<Leader>gc"     , "<cmd>Telescope git_commits<CR>"             , desc = "Git Commits"       , buffer = buf },
        { "<Leader>ga"     , "<cmd>Telescope git_status<CR>"              , desc = "Git Status"        , buffer = buf }
    }
end
