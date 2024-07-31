V.mappings.global = {
    { "t", group = "Tabs", nowait = false, remap = false },

    { "td"  , "<cmd>tabclose<CR>"                           , desc = "Close Tab"           , nowait = false, remap = false },
    { "te"  , '<cmd>lua require("FTerm").toggle()<CR>'      , desc = "Toggle Terminal"     , nowait = false, remap = false },
    { "tf"  , "<cmd>NeoTreeFocusToggle<CR>"                 , desc = "Toggle File Editor"  , nowait = false, remap = false },
    { "th"  , "<cmd>tabprevious<CR>"                        , desc = "Previous Tab"        , nowait = false, remap = false },
    { "tl"  , "<cmd>tabnext<CR>"                            , desc = "Next Tab"            , nowait = false, remap = false },
    { "tn"  , "<cmd>tabnew<CR>"                             , desc = "New Tab"             , nowait = false, remap = false },

    { "s", group = "Splits", nowait = false, remap = false },

    { "sq"  , "<cmd>wincmd q<CR>"                           , desc = "Close Split"         , nowait = false, remap = false },
    { "sv"  , "<cmd>wincmd v<CR>"                           , desc = "Vertical Split"      , nowait = false, remap = false },
    { "ss"  , "<cmd>wincmd s<CR>"                           , desc = "Horizontal Split"    , nowait = false, remap = false },
    { "sw"  , "<cmd>wincmd w<CR>"                           , desc = "Cycle Splits"        , nowait = false, remap = false },

    { "su"  , "<cmd>wincmd _<CR>"                           , desc = "Max Out Height"      , nowait = false, remap = false },
    { "si"  , "<cmd>wincmd |<CR>"                           , desc = "Max Out Width"       , nowait = false, remap = false },
    { "sp"  , "<cmd>wincmd =<CR>"                           , desc = "Equalize Splits"     , nowait = false, remap = false },

    { "sh"  , "<cmd>wincmd h<CR>"                           , desc = "Move to Left Split"  , nowait = false, remap = false },
    { "sj"  , "<cmd>wincmd j<CR>"                           , desc = "Move to Bottom Split", nowait = false, remap = false },
    { "sk"  , "<cmd>wincmd k<CR>"                           , desc = "Move to Top Split"   , nowait = false, remap = false },
    { "sl"  , "<cmd>wincmd l<CR>"                           , desc = "Move to Right Split" , nowait = false, remap = false },

    { "sH"  , "<cmd>wincmd 6<<CR>"                          , desc = "Decrease Width"      , nowait = false, remap = false },
    { "sJ"  , "<cmd>wincmd 4-<CR>"                          , desc = "Decrease Height"     , nowait = false, remap = false },
    { "sK"  , "<cmd>wincmd 4+<CR>"                          , desc = "Increase Height"     , nowait = false, remap = false },
    { "sL"  , "<cmd>wincmd 6><CR>"                          , desc = "Increase Width"      , nowait = false, remap = false },

    { "m"   , "<Plug>(leap-forward-to)"                     , desc = "Leap Forward"        , nowait = false, remap = false },
    { "M"   , "<Plug>(leap-backward-to)"                    , desc = "Leap Backward"       , nowait = false, remap = false },

    { "\\", group = "V1602", nowait = false, remap = false },

    { "\\h" , "<cmd>TSToggle highlight<CR>"                 , desc = "Toggle TS Highlight" , nowait = false, remap = false },
    { "\\m" , "<cmd>Mason<CR>"                              , desc = "Open Mason"          , nowait = false, remap = false },
    { "\\p" , "<cmd>Lazy<CR>"                               , desc = "Open Plugin Manager" , nowait = false, remap = false },
    { "\\r" , '<cmd>lua require("persistence").load()<cr>'  , desc = "Restore Session"     , nowait = false, remap = false },
    { "\\z" , "<cmd>ZenMode<CR>"                            , desc = "Toggle Zen Mode"     , nowait = false, remap = false },

    { "\\u", group = "Update", nowait = false, remap = false },

    { "\\um", "<cmd>MasonUpdate<CR>"                        , desc = "Mason"               , nowait = false, remap = false },
    { "\\up", "<cmd>Lazy sync<CR>"                          , desc = "Plugins"             , nowait = false, remap = false },
    { "\\ut", "<cmd>TSUpdate all<CR>"                       , desc = "Treesitter"          , nowait = false, remap = false },

    { "\\t", group = "Telescope", nowait = false, remap = false },

    { "\\ta", "<cmd>Telescope git_status<CR>"               , desc = "Git Status"          , nowait = false, remap = false },
    { "\\tb", "<cmd>Telescope buffers<CR>"                  , desc = "Find Buffers"        , nowait = false, remap = false },
    { "\\tc", "<cmd>Telescope git_commits<CR>"              , desc = "Git Commits"         , nowait = false, remap = false },
    { "\\tf", "<cmd>Telescope find_files<CR>"               , desc = "Find Files"          , nowait = false, remap = false },
    { "\\tg", "<cmd>Telescope live_grep<CR>"                , desc = "Grep Time"           , nowait = false, remap = false },
    { "\\th", "<cmd>Telescope help_tags<CR>"                , desc = "Help Tags"           , nowait = false, remap = false },
    { "\\tl", "<cmd>Telescope git_branches<CR>"             , desc = "Git Branches"        , nowait = false, remap = false },
    { "\\ts", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Fuzzy Find"          , nowait = false, remap = false },
    { "\\tt", "<cmd>Telescope builtin<CR>"                  , desc = "Open Telescope"      , nowait = false, remap = false },

    { "M"    , "<Plug>(leap-backward-till)", desc = "Leap Backward"  , mode = "v", nowait = false, remap = false },
    { "m"    , "<Plug>(leap-forward-till)" , desc = "Leap Forward"   , mode = "v", nowait = false, remap = false },

    { "<Esc>", "\28\14"                    , desc = "Terminal Escape", mode = "t", nowait = false, remap = false },
}
