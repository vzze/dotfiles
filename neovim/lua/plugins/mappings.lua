local M = {}

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

    ["<leader>ug"]  = { name = "+git"                                                          },
    ["<leader>ugt"] = { ":CocCommand git.browserOpen<CR>"            , "Git Info Location"     },
    ["<leader>ugc"] = { ":CocCommand git.chunkInfo<CR>"              , "Git Chunk Info"        },

    ["<leader>uz"]  = { ":ZenMode<CR>"                               , "Zen Mode"              },

    ["<leader>c"]   = { name = "+code"                                                         },
    ["<leader>co"]  = { ":call v:lua.ShowDocs()<CR>"                 , "Shows Docs"            },
    ["<leader>cn"]  = { "<Plug>(coc-diagnostic-prev)"                , "Diagnostic Prev"       },
    ["<leader>cm"]  = { "<Plug>(coc-diagnostic-next)"                , "Diagnostic Next"       },
    ["<leader>cd"]  = { "<Plug>(coc-definition)"                     , "Code Definition"       },
    ["<leader>cw"]  = { ":CocDiagnostic<CR>"                         , "Diagnostic Window"     },
    ["<leader>cy"]  = { "<Plug>(coc-type-definition)"                , "Code Type Def"         },
    ["<leader>ci"]  = { "<Plug>(coc-implementation)"                 , "Code Impl"             },
    ["<leader>cr"]  = { "<Plug>(coc-references)"                     , "Code Ref"              },
    ["<leader>ca"]  = { "<Plug>(coc-codeaction)"                     , "Code Action"           },
    ["<leader>cf"]  = { "<Plug>(coc-fix-current)"                    , "Auto Fix"              },
    ["<leader>cc"]  = { "<Plug>(coc-codelens-action)"                , "Code Lens"             },
    ["<leader>cl"]  = { name = "+list"                                                         },
    ["<leader>cld"] = { ":<C-u>CocList diagnostics<CR>"              , "List Diagnostics"      },
    ["<leader>clo"] = { ":<C-u>CocList outline<CR>"                  , "Current Doc Symbols"   },
    ["<leader>cls"] = { ":<C-u>CocList -I symbols<CR>"               , "Workspace Symbols"     },

    ["s"]           = { name = "+splits"                                                       },
    ["sq"]          = { ":quit<CR>"                                  , "Quit Current Split"    },
    ["sh"]          = { "<cmd>FocusSplitLeft<CR>"                    , "Split Left"            },
    ["sj"]          = { "<cmd>FocusSplitDown<CR>"                    , "Split Down"            },
    ["sk"]          = { "<cmd>FocusSplitUp<CR>"                      , "Split Up"              },
    ["sl"]          = { "<cmd>FocusSplitRight<CR>"                   , "Split Right"           },
    ["sm"]          = { "<cmd>FocusMaximise<CR>"                     , "Maximizes Split"       },
    ["ss"]          = { "<cmd>FocusSplitCycle<CR>"                   , "Cycle Splits"          },
    ["sS"]          = { "<cmd>FocusSplitCycle reverse<CR>"           , "Reverse Cycle Splits"  },
    ["sr"]          = { name = "+Switch CC and HH"                                             },
    ["src"]         = { ":CocCommand clangd.switchSourceHeader<CR>"  , "Switch CC and HH"      },

    ["gc"]          = { ":CommentToggle<CR>"                         , "Toggle Comments"       }
}

M.visual = {
    ["g"]  = { name = "+Text Edit"                                                    },
    ["gc"] = { ":'<,'>CommentToggle<CR>"                    , "Toggle Comments"       },
    ["g)"] = { ":<C-u>call v:lua.Surround('(', ')')<CR>"    , "Visual Surround"       },
    ["g]"] = { ":<C-u>call v:lua.Surround('[', ']')<CR>"    , "Visual Surround"       },
    ["g}"] = { ":<C-u>call v:lua.Surround('{', '}')<CR>"    , "Visual Surround"       },
    ["g>"] = { ":<C-u>call v:lua.Surround('<', '>')<CR>"    , "Visual Surround"       },
    ["g'"] = { [[:<C-u>call v:lua.Surround("'", "'")<CR>]]  , "Visual Surround"       },
    ["g`"] = { [[:<C-u>call v:lua.Surround("`", "`")<CR>]]  , "Visual Surround"       },
    ['g"'] = { [[:<C-u>call v:lua.Surround('"', '"')<CR>]]  , "Visual Surround"       }
}

M.insert = {
    ["<CR>"]    = { [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]]     , "Report Enter" , expr = true },
    ["<TAB>"]   = { 'coc#pum#visible() ? coc#pum#next(1) : v:lua.CheckBackSpace() ? "<TAB>" : coc#refresh()' , "Report Tab"   , expr = true },
    ["<S-TAB>"] = { [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]]                                       , "Report S-Tab" , expr = true }
}

M.termin = {
    ["jj"] = { vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true) , "Term Normal Mode" }
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
