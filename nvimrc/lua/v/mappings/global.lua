local wrap = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true , true)
end

V.mappings.global = {
    normal = {
        ["t"]           = { name = "Tabs"                                                            },
        ["th"]          = { "<cmd>tabprevious<CR>"                          , "Previous Tab"         },
        ["tl"]          = { "<cmd>tabnext<CR>"                              , "Next Tab"             },
        ["tn"]          = { "<cmd>tabnew<CR>"                               , "New Tab"              },
        ["td"]          = { "<cmd>tabclose<CR>"                             , "Close Tab"            },
        ["te"]          = { "<cmd>lua require(\"FTerm\").toggle()<CR>"      , "Toggle Terminal"      },
        ["tf"]          = { "<cmd>NeoTreeFocusToggle<CR>"                   , "Toggle File Editor"   },

        ["s"]           = { name = "Splits"                                                          },
        ["sq"]          = { "<cmd>wincmd q<CR>"                             , "Close Split"          },
        ["sv"]          = { "<cmd>wincmd v<CR>"                             , "Vertical Split"       },
        ["ss"]          = { "<cmd>wincmd s<CR>"                             , "Horizontal Split"     },
        ["sw"]          = { "<cmd>wincmd w<CR>"                             , "Cycle Splits"         },
        ["sr"]          = { "<cmd>CocCommand clangd.switchSourceHeader<CR>" , "Switch HH & CC"       },

        ["su"]          = { "<cmd>wincmd _<CR>"                             , "Max Out Height"       },
        ["si"]          = { "<cmd>wincmd |<CR>"                             , "Max Out Width"        },
        ["sp"]          = { "<cmd>wincmd =<CR>"                             , "Equalize Splits"      },

        ["sl"]          = { "<cmd>wincmd l<CR>"                             , "Move to Right Split"  },
        ["sk"]          = { "<cmd>wincmd k<CR>"                             , "Move to Top Split"    },
        ["sj"]          = { "<cmd>wincmd j<CR>"                             , "Move to Bottom Split" },
        ["sh"]          = { "<cmd>wincmd h<CR>"                             , "Move to Left Split"   },

        ["sL"]          = { "<cmd>wincmd 6><CR>"                            , "Increase Width"       },
        ["sH"]          = { "<cmd>wincmd 6<<CR>"                            , "Decrease Width"       },
        ["sK"]          = { "<cmd>wincmd 4+<CR>"                            , "Increase Height"      },
        ["sJ"]          = { "<cmd>wincmd 4-<CR>"                            , "Decrease Height"      },

        ["<leader>"]    = { name = "V1602"                                                           },
        ["<leader>h"]   = { "<cmd>TSToggle highlight<CR>"                   , "Toggle TS Highlight"  },
        ["<leader>s"]   = { "<Plug>(leap-forward-to)"                       , "Leap Forward"         },
        ["<leader>S"]   = { "<Plug>(leap-backward-to)"                      , "Leap Backward"        },
        ["<leader>z"]   = { "<cmd>ZenMode<CR>"                              , "Toggle Zen Mode"      },
        ["<leader>l"]   = { "<cmd>Lazy<CR>"                                 , "Open Plugin Manager"  },

        ["<leader>u"]   = { name = "Update"                                                          },
        ["<leader>up"]  = { "<cmd>Lazy sync<CR>"                            , "Plugins"              },
        ["<leader>ul"]  = { "<cmd>CocUpdate<CR>"                            , "Language Servers"     },
        ["<leader>ut"]  = { "<cmd>TSUpdate all<CR>"                         , "Treesitter"           },

        ["<leader>t"]   = { name = "Telescope"                                                       },
        ["<leader>tt"]  = { "<cmd>Telescope builtin<CR>"                    , "Open Telescope"       },
        ["<leader>tf"]  = { "<cmd>Telescope find_files<CR>"                 , "Find Files"           },
        ["<leader>tg"]  = { "<cmd>Telescope live_grep<CR>"                  , "Grep Time"            },
        ["<leader>tb"]  = { "<cmd>Telescope buffers<CR>"                    , "Find Buffers"         },
        ["<leader>th"]  = { "<cmd>Telescope help_tags<CR>"                  , "Help Tags"            },
        ["<leader>ts"]  = { "<cmd>Telescope current_buffer_fuzzy_find<CR>"  , "Fuzzy Find"           },
        ["<leader>tc"]  = { "<cmd>Telescope git_commits<CR>"                , "Git Commits"          },
        ["<leader>tl"]  = { "<cmd>Telescope git_branches<CR>"               , "Git Branches"         },
        ["<leader>ta"]  = { "<cmd>Telescope git_status<CR>"                 , "Git Status"           },

        ["<leader>c"]   = { name = "CoC"                                                             },
        ["<leader>co"]  = { "<cmd>call v:lua._Internal.ShowDocs()<CR>"      , "Shows Docs"           },
        ["<leader>cn"]  = { "<Plug>(coc-diagnostic-prev)"                   , "Diagnostic Prev"      },
        ["<leader>cm"]  = { "<Plug>(coc-diagnostic-next)"                   , "Diagnostic Next"      },
        ["<leader>cd"]  = { "<Plug>(coc-definition)"                        , "Code Definition"      },
        ["<leader>cw"]  = { "<cmd>CocDiagnostic<CR>"                        , "Diagnostic Window"    },
        ["<leader>cy"]  = { "<Plug>(coc-type-definition)"                   , "Code Type Definition" },
        ["<leader>ci"]  = { "<Plug>(coc-implementation)"                    , "Code Implementation"  },
        ["<leader>cr"]  = { "<Plug>(coc-references)"                        , "Code References"      },
        ["<leader>ca"]  = { "<Plug>(coc-codeaction)"                        , "Code Action"          },
        ["<leader>cf"]  = { "<Plug>(coc-fix-current)"                       , "Auto Fix"             },

        ["<leader>cl"]  = { name = "List"                                                            },
        ["<leader>cld"] = { "<cmd>CocList diagnostics<CR>"                  , "List Diagnostics"     },
        ["<leader>clo"] = { "<cmd>CocList outline<CR>"                      , "Current Doc Symbols"  },
        ["<leader>cls"] = { "<cmd>CocList -I symbols<CR>"                   , "Workspace Symbols"    },

        ["gc"]          = { "<cmd>CommentToggle<CR>"                        , "Comment Line"         },

        ["<C-f>"]       = { 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', expr = true    },
        ["<C-b>"]       = { 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', expr = true    }
    },
    visual = {
        ["gc"]          = { ":CommentToggle<CR>"                            , "Comment Block"        },

        ["<leader>s"]   = { "<Plug>(leap-forward-till)"                     , "Leap Forward"         },
        ["<leader>S"]   = { "<Plug>(leap-backward-till)"                    , "Leap Backward"        },

        ["<C-f>"]       = { 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', "ScrollD", expr = true },
        ["<C-b>"]       = { 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', "ScrollU", expr = true }
    },
    insert = {
        ["<CR>"]        = { "v:lua._Internal.CompletionConfirm()", "Confirm", expr = true            },

        ["<TAB>"]       = { 'coc#pum#visible() ? coc#pum#next(1) : v:lua._Internal.CheckBackSpace() ? "<TAB>" : coc#refresh()', "TAB"    , expr = true },
        ["<S-TAB>"]     = { [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]]                                                , "S-TAB"  , expr = true },
        ["<C-f>"]       = { 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"'                            , "ScrollD", expr = true },
        ["<C-b>"]       = { 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"'                             , "ScrollU", expr = true }
    },
    terminal = {
        ["<Esc>"]       = { wrap("<C-\\><C-n>"), "Terminal Escape" }
    }
}
