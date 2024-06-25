local wrap = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true , true)
end

V.mappings.global = {
    normal = {
        ["t"]    = { name = "Tabs"                                                            },
        ["th"]   = { "<cmd>tabprevious<CR>"                          , "Previous Tab"         },
        ["tl"]   = { "<cmd>tabnext<CR>"                              , "Next Tab"             },
        ["tn"]   = { "<cmd>tabnew<CR>"                               , "New Tab"              },
        ["td"]   = { "<cmd>tabclose<CR>"                             , "Close Tab"            },
        ["te"]   = { "<cmd>lua require(\"FTerm\").toggle()<CR>"      , "Toggle Terminal"      },
        ["tf"]   = { "<cmd>NeoTreeFocusToggle<CR>"                   , "Toggle File Editor"   },

        ["s"]    = { name = "Splits"                                                          },
        ["sq"]   = { "<cmd>wincmd q<CR>"                             , "Close Split"          },
        ["sv"]   = { "<cmd>wincmd v<CR>"                             , "Vertical Split"       },
        ["ss"]   = { "<cmd>wincmd s<CR>"                             , "Horizontal Split"     },
        ["sw"]   = { "<cmd>wincmd w<CR>"                             , "Cycle Splits"         },

        ["su"]   = { "<cmd>wincmd _<CR>"                             , "Max Out Height"       },
        ["si"]   = { "<cmd>wincmd |<CR>"                             , "Max Out Width"        },
        ["sp"]   = { "<cmd>wincmd =<CR>"                             , "Equalize Splits"      },

        ["sl"]   = { "<cmd>wincmd l<CR>"                             , "Move to Right Split"  },
        ["sk"]   = { "<cmd>wincmd k<CR>"                             , "Move to Top Split"    },
        ["sj"]   = { "<cmd>wincmd j<CR>"                             , "Move to Bottom Split" },
        ["sh"]   = { "<cmd>wincmd h<CR>"                             , "Move to Left Split"   },

        ["sL"]   = { "<cmd>wincmd 6><CR>"                            , "Increase Width"       },
        ["sH"]   = { "<cmd>wincmd 6<<CR>"                            , "Decrease Width"       },
        ["sK"]   = { "<cmd>wincmd 4+<CR>"                            , "Increase Height"      },
        ["sJ"]   = { "<cmd>wincmd 4-<CR>"                            , "Decrease Height"      },

        ["m"]    = { "<Plug>(leap-forward-to)"                       , "Leap Forward"         },
        ["M"]    = { "<Plug>(leap-backward-to)"                      , "Leap Backward"        },

        ["\\"]   = { name = "V1602"                                                           },
        ["\\h"]  = { "<cmd>TSToggle highlight<CR>"                   , "Toggle TS Highlight"  },
        ["\\r"]  = { "<cmd>lua require(\"persistence\").load()<cr>"  , "Restore Session"      },
        ["\\z"]  = { "<cmd>ZenMode<CR>"                              , "Toggle Zen Mode"      },
        ["\\p"]  = { "<cmd>Lazy<CR>"                                 , "Open Plugin Manager"  },
        ["\\m"]  = { "<cmd>Mason<CR>"                                , "Open Mason"           },

        ["\\u"]  = { name = "Update"                                                          },
        ["\\up"] = { "<cmd>Lazy sync<CR>"                            , "Plugins"              },
        ["\\ut"] = { "<cmd>TSUpdate all<CR>"                         , "Treesitter"           },
        ["\\um"] = { "<cmd>MasonUpdate<CR>"                          , "Mason"                },

        ["\\t"]  = { name = "Telescope"                                                       },
        ["\\tt"] = { "<cmd>Telescope builtin<CR>"                    , "Open Telescope"       },
        ["\\tf"] = { "<cmd>Telescope find_files<CR>"                 , "Find Files"           },
        ["\\tg"] = { "<cmd>Telescope live_grep<CR>"                  , "Grep Time"            },
        ["\\tb"] = { "<cmd>Telescope buffers<CR>"                    , "Find Buffers"         },
        ["\\th"] = { "<cmd>Telescope help_tags<CR>"                  , "Help Tags"            },
        ["\\ts"] = { "<cmd>Telescope current_buffer_fuzzy_find<CR>"  , "Fuzzy Find"           },
        ["\\tc"] = { "<cmd>Telescope git_commits<CR>"                , "Git Commits"          },
        ["\\tl"] = { "<cmd>Telescope git_branches<CR>"               , "Git Branches"         },
        ["\\ta"] = { "<cmd>Telescope git_status<CR>"                 , "Git Status"           },
    },

    visual = {
        ["m"]    = { "<Plug>(leap-forward-till)"                     , "Leap Forward"         },
        ["M"]    = { "<Plug>(leap-backward-till)"                    , "Leap Backward"        }
    },

    insert = {},

    terminal = {
        ["<Esc>"] = { wrap("<C-\\><C-n>"), "Terminal Escape" }
    }
}
