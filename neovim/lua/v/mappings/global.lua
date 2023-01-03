V.mappings.global = {
    normal = {
        ["t"]           = { name = "+tabs"                                                         },
        ["th"]          = { ":tabprevious<CR>"                            , "Previous Tab"         },
        ["tl"]          = { ":tabnext<CR>"                                , "Next Tab"             },
        ["tn"]          = { ":tabnew<CR>"                                 , "New Tab"              },
        ["td"]          = { ":tabclose<CR>"                               , "Close Tab"            },
        ["te"]          = { "<cmd>lua require(\"FTerm\").toggle()<CR>"    , "Terminal"             },
        ["tf"]          = { ":Dirbuf <Bar> :DirbufSync<CR>"               , "File Editor"          },

        ["s"]           = { name = "+splits"                                                       },
        ["sq"]          = { ":q<CR>"                                      , "Close Split"          },
        ["sh"]          = { "<cmd>FocusSplitLeft<CR>"                     , "Split Left"           },
        ["sj"]          = { "<cmd>FocusSplitDown<CR>"                     , "Split Down"           },
        ["sk"]          = { "<cmd>FocusSplitUp<CR>"                       , "Split Up"             },
        ["sl"]          = { "<cmd>FocusSplitRight<CR>"                    , "Split Right"          },
        ["ss"]          = { "<cmd>FocusSplitCycle<CR>"                    , "Cycle Splits"         },
        ["st"]          = { "<cmd>FocusSplitCycle reverse<CR>"            , "Reverse Cycle Splits" },
        ["sr"]          = { ":CocCommand clangd.switchSourceHeader<CR>"   , "Switch HH & CC"       },

        ["<leader>q"]   = { ":SaveSession<CR> <Bar> :wqa<CR>"             , "Quit & Save Session"  },
        ["<leader>h"]   = { ":TSToggle highlight<CR>"                     , "Toggle Highlight"     },
        ["<leader>d"]   = { ":DiffviewOpen"                               , "DiffViewOpen"         },
        ["<leader>s"]   = { "<Plug>(leap-forward-to)"                     , "Leap Forward"         },
        ["<leader>S"]   = { "<Plug>(leap-backward-to)"                    , "Leap Backward"        },
        ["<leader>z"]   = { ":ZenMode<CR>"                                , "Zen Mode"             },

        ["<leader>u"]   = { name = "+update"                                                       },
        ["<leader>up"]  = { ":PackerSync<CR>"                             , "Plugins"              },
        ["<leader>ul"]  = { ":CocUpdate<CR>"                              , "Language Servers"     },
        ["<leader>ut"]  = { ":TSUpdate all<CR>"                           , "Treesitter"           },

        ["<leader>t"]   = { name = "+telescope"                                                    },
        ["<leader>tt"]  = { "<cmd>Telescope builtin<CR>"                  , "Telescope"            },
        ["<leader>tf"]  = { "<cmd>Telescope find_files<CR>"               , "Find Files"           },
        ["<leader>tg"]  = { "<cmd>Telescope live_grep<CR>"                , "Grep Time"            },
        ["<leader>tb"]  = { "<cmd>Telescope buffers<CR>"                  , "Find Buffers"         },
        ["<leader>th"]  = { "<cmd>Telescope help_tags<CR>"                , "Help Tags"            },
        ["<leader>ts"]  = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Fuzzy Find"           },
        ["<leader>tc"]  = { "<cmd>Telescope git_commits<CR>"              , "Git Commits"          },
        ["<leader>tl"]  = { "<cmd>Telescope git_branches<CR>"             , "Git Branches"         },
        ["<leader>ta"]  = { "<cmd>Telescope git_status<CR>"               , "Git Status"           },

        ["<leader>c"]   = { name = "+coc"                                                          },
        ["<leader>co"]  = { ":call v:lua.ShowDocs()<CR>"                  , "Shows Docs"           },
        ["<leader>cn"]  = { "<Plug>(coc-diagnostic-prev)"                 , "Diagnostic Prev"      },
        ["<leader>cm"]  = { "<Plug>(coc-diagnostic-next)"                 , "Diagnostic Next"      },
        ["<leader>cd"]  = { "<Plug>(coc-definition)"                      , "Code Definition"      },
        ["<leader>cw"]  = { ":CocDiagnostic<CR>"                          , "Diagnostic Window"    },
        ["<leader>cy"]  = { "<Plug>(coc-type-definition)"                 , "Code Type Def"        },
        ["<leader>ci"]  = { "<Plug>(coc-implementation)"                  , "Code Impl"            },
        ["<leader>cr"]  = { "<Plug>(coc-references)"                      , "Code Ref"             },
        ["<leader>ca"]  = { "<Plug>(coc-codeaction)"                      , "Code Action"          },
        ["<leader>cf"]  = { "<Plug>(coc-fix-current)"                     , "Auto Fix"             },

        ["<leader>cl"]  = { name = "+list"                                                         },
        ["<leader>cld"] = { ":<C-u>CocList diagnostics<CR>"               , "List Diagnostics"     },
        ["<leader>clo"] = { ":<C-u>CocList outline<CR>"                   , "Current Doc Symbols"  },
        ["<leader>cls"] = { ":<C-u>CocList -I symbols<CR>"                , "Workspace Symbols"    },

        ["gc"]          = { ":CommentToggle<CR>"                          , "Comment Line"         },

        ["<C-f>"]       = { 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"' , "Scroll Down" , expr = true },
        ["<C-b>"]       = { 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"' , "Scroll Up"   , expr = true },
    },
    visual = {
        ["gc"]          = { ":CommentToggle<CR>"                          , "Comment Block"        },

        ["<leader>s"]   = { "<Plug>(leap-forward-till)"                   , "Leap Forward"         },
        ["<leader>S"]   = { "<Plug>(leap-backward-till)"                  , "Leap Backward"        },

        ["<C-f>"]       = { 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"' , "Scroll Down" , expr = true },
        ["<C-b>"]       = { 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"' , "Scroll Up"   , expr = true }
    },
    insert = {
        ["<CR>"]        = { "v:lua._Internal.CompletionConfirm()"         , "Report Enter" , expr = true },

        ["<TAB>"]       = {
            'coc#pum#visible() ? coc#pum#next(1) : v:lua._Internal.CheckBackSpace() ? "<TAB>" : coc#refresh()',
            "Report Tab", expr = true
        },
        ["<S-TAB>"]     = { [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], "Report S-Tab", expr = true },
        ["<C-f>"]       = { 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"',
            "Scroll Down"  , expr = true
        },
        ["<C-b>"]       = {
            'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"',
            "Scroll Up", expr = true
        },
    },
    terminal = {
        ["<Esc>"]       = { vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true , true), "Term Normal Mode" }
    }
}
