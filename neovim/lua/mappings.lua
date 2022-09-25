local M = {}

local function es_str(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

M.normal = {
    ["<leader>z"]  = { ":ZenMode<CR>"                               , "Zen Mode"              },
    ["<leader>fs"] = { ":Dirbuf <Bar> :DirbufSync<CR>"              , "File Editor"           },
    ["<C-h>"]      = { ":tabprevious<CR>"                           , "Previous Tab"          },
    ["<C-l>"]      = { ":tabnext<CR>"                               , "Next Tab"              },
    ["src"]        = { ":CocCommand clangd.switchSourceHeader<CR>"  , "Switch CC and HH"      },
    ["git"]        = { ":CocCommand git.browserOpen<CR>"            , "Git Info Location"     },
    ["gtc"]        = { ":CocCommand git.chunkInfo<CR>"  , "Git Chunk Info"                    },

    ["t"]          = { name = "+tabs"                                                         },
    ["tn"]         = { ":tabnew<CR>"                                , "New Tab"               },
    ["td"]         = { ":tabclose<CR>"                              , "Close Tab"             },
    ["te"]         = { ":terminal Powershell.exe<CR>"               , "Open Terminal"         },
    ["ti"]         = { ":tabnew <Bar> :terminal Powershell.exe<CR>" , "New Tab Open Terminal" },

    ["K"]          = { ":call v:lua.ShowDocs()<CR>"                       , "Shows Docs"      },

    ["<leader>f"]  = { name = "+file"                                                         },
    ["<leader>ff"] = { "<cmd>Telescope find_files<CR>"              , "Find Files"            },
    ["<leader>fg"] = { "<cmd>Telescope live_grep<CR>"               , "Grep Time"             },
    ["<leader>fb"] = { "<cmd>Telescope buffers<CR>"                 , "Find Buffers"          },
    ["<leader>fh"] = { "<cmd>Telescope help_tags<CR>"               , "Help Tags"             },

    ["s"]          = { name = "+splits"                                                       },
    ["sh"]         = { "<cmd>FocusSplitLeft<CR>"                    , "Split Left"            },
    ["sj"]         = { "<cmd>FocusSplitDown<CR>"                    , "Split Down"            },
    ["sk"]         = { "<cmd>FocusSplitUp<CR>"                      , "Split Up"              },
    ["sl"]         = { "<cmd>FocusSplitRight<CR>"                   , "Split Right"           },

    ["gcc"]        = { "<Plug>CommentaryLine"                       , "Comment Line"          },
    ["gc"]         = { "<Plug>Commentary"                           , "Comment"               },

    ["cs"]         = { "<Plug>Csurround"                            , "Add Delimiters"        },
    ["ds"]         = { "<Plug>Dsurround"                            , "Remove Delimiters"     },

    ["ys"]         = { "<Plug>Ysurround"                            , "iw Text Object"        },
    ["yss"]        = { "<Plug>Yssurround"                           , "Surround Entire Line"  },

    ["yS"]         = { "<Plug>YSurround"                            , "iw Text Object"        },
    ["ySS"]        = { "<Plug>YSsurround"                           , "Surround Entire Line"  },
    ["ySs"]        = { "<Plug>YSsurround"                           , "Surround Entire Line"  },
}

M.visual = {
    ["gc"]         = { "<Plug>Commentary"                           , "Comment"               }
}

M.insert = {
    ["<CR>"]    = { es_str("coc#pum#visible() ? coc#pum#confirm() : \"\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>\"")       , "Report Enter" , expr = true },
    ["<TAB>"]   = { es_str("coc#pum#visible() ? coc#pum#next(1) : v:lua.CheckBackSpace() ? \"\\<Tab>\" : coc#refresh()")   , "Report Tab"   , expr = true },
    ["<S-TAB>"] = { es_str("coc#pum#visible() ? coc#pum#prev(1) : \"\\<C-h>\"")                                            , "Report S-Tab" , expr = true }
}

M.termin = {
    ["<Esc>"]      = { es_str("<C-\\><C-n>")                        , "Term Normal Mode"      }
}

return M;
