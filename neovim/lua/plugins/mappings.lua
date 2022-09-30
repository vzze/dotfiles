local M = {}

local function es_str(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

M.normal = {
    ["t"]           = { name = "+tabs"                                                         },
    ["th"]          = { ":tabprevious<CR>"                           , "Previous Tab"          },
    ["tl"]          = { ":tabnext<CR>"                               , "Next Tab"              },
    ["tn"]          = { ":tabnew<CR>"                                , "New Tab"               },
    ["td"]          = { ":tabclose<CR>"                              , "Close Tab"             },
    ["te"]          = { "<cmd>lua require(\"FTerm\").toggle()<CR>"   , "Terminal"              },
    ["ts"]          = { ":Dirbuf <Bar> :DirbufSync<CR>"              , "File Editor"           },

    ["<leader>t"]   = { name = "+telescope"                                                    },
    ["<leader>tf"]  = { "<cmd>Telescope find_files<CR>"              , "Find Files"            },
    ["<leader>tg"]  = { "<cmd>Telescope live_grep<CR>"               , "Grep Time"             },
    ["<leader>tb"]  = { "<cmd>Telescope buffers<CR>"                 , "Find Buffers"          },
    ["<leader>th"]  = { "<cmd>Telescope help_tags<CR>"               , "Help Tags"             },

    ["<leader>u"]   = { name = "+util"                                                         },
    ["<leader>ud"]  = { ":call v:lua.ShowDocs()<CR>"                 , "Shows Docs"            },

    ["<leader>ug"]  = { name = "+Git"                                                          },
    ["<leader>ugt"] = { ":CocCommand git.browserOpen<CR>"            , "Git Info Location"     },
    ["<leader>ugc"] = { ":CocCommand git.chunkInfo<CR>"              , "Git Chunk Info"        },

    ["<leader>uz"]  = { ":ZenMode<CR>"                               , "Zen Mode"              },

    ["s"]           = { name = "+splits"                                                       },
    ["sq"]          = { ":quit<CR>"                                  , "Quit Current Window"   },
    ["sh"]          = { "<cmd>FocusSplitLeft<CR>"                    , "Split Left"            },
    ["sj"]          = { "<cmd>FocusSplitDown<CR>"                    , "Split Down"            },
    ["sk"]          = { "<cmd>FocusSplitUp<CR>"                      , "Split Up"              },
    ["sl"]          = { "<cmd>FocusSplitRight<CR>"                   , "Split Right"           },
    ["sr"]          = { name = "+Switch CC and HH"                                             },
    ["src"]         = { ":CocCommand clangd.switchSourceHeader<CR>"  , "Switch CC and HH"      },

    ["gcc"]         = { "<Plug>CommentaryLine"                       , "Comment Line"          },
    ["gc"]          = { "<Plug>Commentary"                           , "Comment"               },

    ["cs"]          = { "<Plug>Csurround"                            , "Add Delimiters"        },
    ["ds"]          = { "<Plug>Dsurround"                            , "Remove Delimiters"     },

    ["ys"]          = { "<Plug>Ysurround"                            , "iw Text Object"        },
    ["yss"]         = { "<Plug>Yssurround"                           , "Surround Entire Line"  },

    ["yS"]          = { "<Plug>YSurround"                            , "iw Text Object"        },
    ["ySS"]         = { "<Plug>YSsurround"                           , "Surround Entire Line"  },
    ["ySs"]         = { "<Plug>YSsurround"                           , "Surround Entire Line"  },
}

M.visual = {
    ["gc"]          = { "<Plug>Commentary"                           , "Comment"               }
}

M.insert = {
    ["<CR>"]    = { es_str("coc#pum#visible() ? coc#pum#confirm() : \"\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>\"")       , "Report Enter" , expr = true },
    ["<TAB>"]   = { es_str("coc#pum#visible() ? coc#pum#next(1) : v:lua.CheckBackSpace() ? \"\\<Tab>\" : coc#refresh()")   , "Report Tab"   , expr = true },
    ["<S-TAB>"] = { es_str("coc#pum#visible() ? coc#pum#prev(1) : \"\\<C-h>\"")                                            , "Report S-Tab" , expr = true }
}

M.termin = {
    ["<Esc>"]       = { es_str("<C-\\><C-n>")                        , "Term Normal Mode"      }
}

M.setup = function()
    require("better_escape").setup({
        mapping = {"jk", "jj"},
        timeout = vim.o.timeoutlen,
        clear_empty_lines = false,
        keys = "<Esc>",
    })

    local wk = require("which-key")

    wk.register(M.normal, { mode = "n", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })
    wk.register(M.visual, { mode = "v", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })
    wk.register(M.insert, { mode = "i", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })
    wk.register(M.termin, { mode = "t", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })

    wk.setup({
        icons = {
            breadcrumb = ">>",
            separator = "->",
            group = "+",
        },
        triggers_blacklist = {}
    })
end

return M;
