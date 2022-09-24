local M = {}

M.normal = {
    ["<F4>"]       = { ":ZenMode<CR>"                               , "Zen Mode"              },
    ["file"]       = { ":Dirbuf <Bar> :DirbufSync<CR>"              , "File Editor"           },
    ["<C-h>"]      = { ":tabprevious<CR>"                           , "Previous Tab"          },
    ["<C-l>"]      = { ":tabnext<CR>"                               , "Next Tab"              },
    ["tn"]         = { ":tabnew<CR>"                                , "New Tab"               },
    ["td"]         = { ":tabclose<CR>"                              , "Close Tab"             },
    ["src"]        = { ":CocCommand clangd.switchSourceHeader<CR>"  , "Switch CC and HH"      },
    ["git"]        = { ":CocCommand git.browserOpen<CR>"            , "Git Info Location"     },
    ["gtc"]        = { ":CocCommand clangd.switchSourceHeader<CR>"  , "Git Chunk Info"        },
    ["term"]       = { ":terminal Powershell.exe<CR>"               , "Open Terminal"         },
    ["ttn"]        = { ":tabnew <Bar> :terminal Powershell.exe<CR>" , "New Tab Open Terminal" },
    ["K"]          = { ":call ShowDocs()<CR>"                       , "Shows Docs"            },
    ["<leader>ff"] = { "<cmd>Telescope find_files<CR>"              , "Find Files"            },
    ["<leader>fg"] = { "<cmd>Telescope live_grep<CR>"               , "Grep Time"             },
    ["<leader>fb"] = { "<cmd>Telescope buffers<CR>"                 , "Find Buffers"          },
    ["<leader>fh"] = { "<cmd>Telescope help_tags<CR>"               , "Help Tags"             },
    ["<leader>h"]  = { "<cmd>FocusSplitLeft<CR>"                    , "Split Left"            },
    ["<leader>j"]  = { "<cmd>FocusSplitDown<CR>"                    , "Split Down"            },
    ["<leader>k"]  = { "<cmd>FocusSplitUp<CR>"                      , "Split Up"              },
    ["<leader>l"]  = { "<cmd>FocusSplitRight<CR>"                   , "Split Right"           },
}

M.visual = {

}

M.insert = {

}

M.termin = {
    ["<Esc>"] = { "<C-\\><C-n>", "Terminal Escape" }
}

return M;
