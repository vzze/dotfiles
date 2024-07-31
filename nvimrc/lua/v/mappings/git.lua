V.mappings.git = {
    { "\\g", group = "git", nowait = false, remap = false },

    { "\\gn", "<cmd>Gitsigns next_hunk<CR>"                , desc = "Next Hunk"         , nowait = false, remap = false },
    { "\\gN", "<cmd>Gitsigns prev_hunk<CR>"                , desc = "Prev Hunk"         , nowait = false, remap = false },
    { "\\gs", "<cmd>Gitsigns stage_buffer<CR>"             , desc = "Stage Buffer"      , nowait = false, remap = false },
    { "\\gu", "<cmd>Gitsigns undo_stage_hunk<CR>"          , desc = "Undo Stage Hunk"   , nowait = false, remap = false },
    { "\\gr", "<cmd>Gitsigns reset_buffer<CR>"             , desc = "Reset Buffer"      , nowait = false, remap = false },
    { "\\gh", "<cmd>Gitsigns reset_hunk<CR>"               , desc = "Reset Hunk"        , nowait = false, remap = false },
    { "\\gp", "<cmd>Gitsigns preview_hunk<CR>"             , desc = "Preview Hunk"      , nowait = false, remap = false },
    { "\\gb", "<cmd>Gitsigns blame_line<CR>"               , desc = "Blame Line"        , nowait = false, remap = false },
    { "\\gB", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Current Blame Line", nowait = false, remap = false },
    { "\\gd", "<cmd>Gitsigns toggle_deleted<CR>"           , desc = "Toggle Deleted"    , nowait = false, remap = false }
}
