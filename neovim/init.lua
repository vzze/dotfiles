V = {
    colorscheme = "default",
    post_setup_callback = function() end,
    providers = {
        ['nodejs'] = true,
        ['python3'] = true,
        ['perl'] = false,
        ['ruby'] = false,
    },
    vim_settings = {
        number = true,
        relativenumber = true,
        expandtab = true,
        tabstop = 8,
        shiftwidth = 4,
        smarttab = true,
        softtabstop = 1,
        mouse = 'a',
        encoding = "UTF-8",
        clipboard = vim.o.clipboard .. "unnamedplus",
        signcolumn = "yes",
        completeopt = { "menu", "preview" },
        hlsearch = true,
        updatetime = 300,
        timeoutlen = 500,
        backup = false,
        ruler = false,
        writebackup = false,
        fillchars = {
            stl = ' ', stlnc = ' ', vert = ' '
        },
        cmdheight = 0,
        sessionoptions = {
            "blank", "buffers", "curdir", "folds", "help", "tabpages", "winsize", "winpos", "terminal"
        },
        foldmethod = "indent",
        foldlevelstart = -1,
        foldcolumn = "1",
        laststatus = 1,
        hidden = false
    },
    splash_screen = {
        info = true,
        lines_sep = 1
    },
    terminal = {
        windows = "pwsh.exe",
        unix = "bash"
    },
    add_pairs = {
        { '#include <', '>' },
        { '<', '>', before = "%a" },
        { '`', '`' },
    },
    extra_plugins = {},
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
        global = {
            normal = {
                ["t"]           = { name = "+tabs"                                                         },
                ["th"]          = { "<cmd>tabprevious<CR>"                        , "Previous Tab"         },
                ["tl"]          = { "<cmd>tabnext<CR>"                            , "Next Tab"             },
                ["tn"]          = { "<cmd>tabnew<CR>"                             , "New Tab"              },
                ["td"]          = { "<cmd>tabclose<CR>"                           , "Close Tab"            },
                ["te"]          = { "<cmd>lua require(\"FTerm\").toggle()<CR>"    , "Terminal"             },
                ["tf"]          = { "<cmd>Dirbuf <Bar> :DirbufSync<CR>"           , "File Editor"          },

                ["s"]           = { name = "+splits"                                                       },
                ["sq"]          = { "<cmd>q<CR>"                                  , "Close Split"          },
                ["sh"]          = { "<cmd>FocusSplitLeft<CR>"                     , "Split Left"           },
                ["sj"]          = { "<cmd>FocusSplitDown<CR>"                     , "Split Down"           },
                ["sk"]          = { "<cmd>FocusSplitUp<CR>"                       , "Split Up"             },
                ["sl"]          = { "<cmd>FocusSplitRight<CR>"                    , "Split Right"          },
                ["ss"]          = { "<cmd>FocusSplitCycle<CR>"                    , "Cycle Splits"         },
                ["st"]          = { "<cmd>FocusSplitCycle reverse<CR>"            , "Reverse Cycle Splits" },

                ["<leader>q"]   = { "<cmd>SaveSession<CR> <Bar> :wqa<CR>"         , "Quit & Save Session"  },
                ["<leader>h"]   = { "<cmd>TSToggle highlight<CR>"                 , "Toggle Highlight"     },
                ["<leader>d"]   = { "<cmd>DiffviewOpen"                           , "DiffViewOpen"         },
                ["<leader>s"]   = { "<Plug>(leap-forward-to)"                     , "Leap Forward"         },
                ["<leader>S"]   = { "<Plug>(leap-backward-to)"                    , "Leap Backward"        },
                ["<leader>z"]   = { "<cmd>ZenMode<CR>"                            , "Zen Mode"             },

                ["<leader>u"]   = { name = "+update"                                                       },
                ["<leader>up"]  = { "<cmd>PackerSync<CR>"                         , "Plugins"              },
                ["<leader>ut"]  = { "<cmd>TSUpdate all<CR>"                       , "Treesitter"           },

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

                ["gc"]          = { "<cmd>CommentToggle<CR>"                      , "Comment Line"         },
            },
            visual = {
                ["gc"]          = { "<cmd>CommentToggle<CR>"                      , "Comment Block"        },

                ["<leader>s"]   = { "<Plug>(leap-forward-till)"                   , "Leap Forward"         },
                ["<leader>S"]   = { "<Plug>(leap-backward-till)"                  , "Leap Backward"        },
            },
            insert = {
                ['<CR>']        = { "v:lua._Internal.CR()"                        , "Enter"     , expr = true },
                ['<BS>']        = { "v:lua._Internal.BS()"                        , "Backspace" , expr = true },
                ['<Esc>']       = { [[pumvisible() ? "<c-e><esc>" : "<esc>"]]     , "Esc"       , expr = true },
                ['<c-c>']       = { [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]]     , "CC"        , expr = true },
                ['<Tab>']       = { [[pumvisible() ? "<c-n>" : "<tab>"]]          , "Tab"       , expr = true },
                ['<S-Tab>']     = { [[pumvisible() ? "<c-p>" : "<bs>"]]           , "Shift Tab" , expr = true }
            },
            terminal = {
                ["<Esc>"]       = { vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true , true), "Term Normal Mode" }
            }
        },
        git = {
            normal = {
                ["<leader>g"]   = { name = "+git"                                                          },
                ["<leader>gn"]  = { "<cmd>Gitsigns next_hunk<CR>"                 , "Next Hunk"            },
                ["<leader>gN"]  = { "<cmd>Gitsigns prev_hunk<CR>"                 , "Prev Hunk"            },
                ["<leader>gs"]  = { "<cmd>Gitsigns stage_buffer<CR>"              , "Stage Buffer"         },
                ["<leader>gu"]  = { "<cmd>Gitsigns undo_stage_hunk<CR>"           , "Undo Stage Hunk"      },
                ["<leader>gr"]  = { "<cmd>Gitsigns reset_buffer<CR>"              , "Reset Buffer"         },
                ["<leader>gp"]  = { "<cmd>Gitsigns preview_hunk<CR>"              , "Preview Hunk"         },
                ["<leader>gb"]  = { "<cmd>Gitsigns blame_line<CR>"                , "Blame Line"           },
                ["<leader>gB"]  = { "<cmd>Gitsigns toggle_current_line_blame<CR>" , "Current Blame Line"   },
                ["<leader>gd"]  = { "<cmd>Gitsigns toggle_deleted<CR>"            , "Toggle Deleted"       }
            },
            visual = {},
            insert = {},
            terminal = {},
        },
        lsp = {
            normal = {
                ["<leader>l"]  = { name = "+lsp"                                                       },
                ["<leader>lD"] = { vim.lsp.buf.declaration                    , "Declaration"          },
                ["<leader>ld"] = { vim.lsp.buf.definition                     , "Definition"           },
                ["<leader>lt"] = { vim.lsp.buf.type_definition                , "Type Definition"      },
                ["<leader>li"] = { vim.lsp.buf.implementation                 , "Implementation"       },
                ["<leader>lK"] = { vim.lsp.buf.hover                          , "Hover"                },
                ["<leader>la"] = { vim.lsp.buf.code_action                    , "Code Action"          },
                ["<leader>ls"] = { vim.lsp.buf.signature_help                 , "Signature Help"       },
                ["<leader>lr"] = { vim.lsp.buf.references                     , "References"           },
                ["<leader>ln"] = { vim.diagnostic.goto_next                   , "Next Diagnostic"      },
                ["<leader>lN"] = { vim.diagnostic.goto_prev                   , "Prev Diagnostic"      },
                ["<leader>lo"] = { vim.diagnostic.open_float                  , "Diagnostic Float"     }
            },
            visual = {},
            insert = {},
            terminal = {}
        }
    },
    lspconfig = {
        ['sumneko_lua'] = {
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT'
                    },
                    diagnostics = {
                        globals = {'vim'}
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true)
                    },
                    telemetry = {
                        enable = false
                    }
                }
            }
        },
        ['clangd'] = {
            on_attach = function(_, bufnr)
                local wk = require("which-key")
                wk.register(V.mappings.lsp.normal  , { mode = "n", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })
                wk.register(V.mappings.lsp.visual  , { mode = "v", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })
                wk.register(V.mappings.lsp.insert  , { mode = "i", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })
                wk.register(V.mappings.lsp.terminal, { mode = "t", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })
                wk.register({
                    ['sr'] = { "<cmd>ClangdSwitchSourceHeader<CR>", "Switch CC & HH" }
                }, { mode = "n", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })
            end,
            root_dir = require("lspconfig").util.root_pattern(
                '.clangd',
                '.clang-tidy',
                '.clang-format',
                'compile_commands.json',
                'build/compile_commands.json',
                'compile_flags.txt',
                'configure.ac',
                '.git'
            )
        }
    }
}

require("v").setup()
