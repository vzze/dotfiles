V = {
    colorscheme = "default",
    post_setup_callback = function() end,
    splash_screen = {
        info = true,
        lines_sep = 1
    },
    terminal = {
        windows = "pwsh.exe",
        unix = "bash"
    },
    add_pairs = {
        { '<', '>' },
        { '|', '|' },
        { '`', '`' },
    },
    lualine = {
        theme = {
            ["normal"] = {
                ["a"] = { ["fg"] = "#1f1c21", ["bg"] = "#fcc0ff" },
                ["b"] = { ["fg"] = "#fcc0ff", ["bg"] = ""        },
                ["c"] = { ["fg"] = "#fcc0ff", ["bg"] = ""        }
            },
            ["insert"] = {
                ["a"] = { ["fg"] = "#1f1c21", ["bg"] = "#60ff60" },
                ["b"] = { ["fg"] = "#60ff60", ["bg"] = ""        },
                ["c"] = { ["fg"] = "#60ff60", ["bg"] = ""        }
            },
            ["visual"] = {
                ["a"] = { ["fg"] = "#1f1c21", ["bg"] = "#fa8dff" },
                ["b"] = { ["fg"] = "#fa8dff", ["bg"] = ""        },
                ["c"] = { ["fg"] = "#fa8dff", ["bg"] = ""        }
            },
            ["replace"] = {
                ["a"] = { ["fg"] = "#1f1c21", ["bg"] = "#00fbff" },
                ["b"] = { ["fg"] = "#00fbff", ["bg"] = ""        },
                ["c"] = { ["fg"] = "#00fbff", ["bg"] = ""        }
            },
            ["command"] = {
                ["a"] = { ["fg"] = "#1f1c21", ["bg"] = "#f14c4c" },
                ["b"] = { ["fg"] = "#f14c4c", ["bg"] = ""        },
                ["c"] = { ["fg"] = "#f14c4c", ["bg"] = ""        }
            },
            ["inactive"] = {
                ["a"] = { ["fg"] = "#00fbff", ["bg"] = ""        },
                ["b"] = { ["fg"] = "#00fbff", ["bg"] = ""        },
                ["c"] = { ["fg"] = "#00fbff", ["bg"] = ""        }
            }
        }
    },
    mappings = {
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
            ["sr"]          = { ":CocCommand clangd.switchSourceHeader<CR>"   , "Switch CC and HH"     },

            ["<leader>q"]   = { ":SaveSession<CR> <Bar> :wqa<CR>"             , "Quit & Save Session"  },
            ["<leader>s"]   = { "<Plug>(leap-forward-to)"                     , "Leap Forward"         },
            ["<leader>S"]   = { "<Plug>(leap-backward-to)"                    , "Leap Backward"        },
            ["<leader>z"]   = { ":ZenMode<CR>"                                 , "Zen Mode"            },

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

            ["<leader>g"]   = { name = "+git"                                                          },
            ["<leader>gn"]  = { ":Gitsigns next_hunk<CR>"                     , "Next Hunk"            },
            ["<leader>gN"]  = { ":Gitsigns prev_hunk<CR>"                     , "Prev Hunk"            },
            ["<leader>gs"]  = { ":Gitsigns stage_buffer<CR>"                  , "Stage Buffer"         },
            ["<leader>gu"]  = { ":Gitsigns undo_stage_hunk<CR>"               , "Undo Stage Hunk"      },
            ["<leader>gr"]  = { ":Gitsigns reset_buffer<CR>"                  , "Reset Buffer"         },
            ["<leader>gp"]  = { ":Gitsigns preview_hunk<CR>"                  , "Preview Hunk"         },
            ["<leader>gb"]  = { ":Gitsigns blame_line<CR>"                    , "Blame Line"           },
            ["<leader>gB"]  = { ":Gitsigns toggle_current_line_blame<CR>"     , "Current Blame Line"   },
            ["<leader>gd"]  = { ":Gitsigns toggle_deleted<CR>"                , "Toggle Deleted"       },

            ["<leader>c"]   = { name = "+code"                                                         },
            ["<leader>co"]  = { "v:lua._Internal.ShowDocs()"                  , "Shows Docs"           },
            ["<leader>cn"]  = { "<Plug>(coc-diagnostic-prev)"                 , "Diagnostic Prev"      },
            ["<leader>cN"]  = { "<Plug>(coc-diagnostic-next)"                 , "Diagnostic Next"      },
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
            ["gc"]          = { ":CommentToggle<CR>"         , "Comment Block"  },

            ["<leader>s"]   = { "<Plug>(leap-forward-till)"  , "Leap Forward"   },
            ["<leader>S"]   = { "<Plug>(leap-backward-till)" , "Leap Backward"  },

            ["<C-f>"]       = { 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"' , "Scroll Down" , expr = true },
            ["<C-b>"]       = { 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"' , "Scroll Up"   , expr = true },
        },
        insert = {
            ["<CR>"]        = { "v:lua._Internal.CompletionConfirm()"                                                              , "Report Enter" , expr = true },
            ["<TAB>"]       = { 'coc#pum#visible() ? coc#pum#next(1) : v:lua._Internal.CheckBackSpace() ? "<TAB>" : coc#refresh()' , "Report Tab"   , expr = true },

            ["<S-TAB>"]     = { [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]]                                         , "Report S-Tab" , expr = true },
            ["<C-f>"]       = { 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"'                     , "Scroll Down"  , expr = true },
            ["<C-b>"]       = { 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"'                      , "Scroll Up"    , expr = true },
        },
        terminal = {
            ["<Esc>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true) , "Term Normal Mode" }
        }
    }
}

require("v").setup()
