function CheckBackSpace()
    local col = vim.fn.col('.') - 1
    ---@diagnostic disable-next-line: undefined-field
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

function ShowDocs()
    ---@diagnostic disable-next-line: missing-parameter
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

return {
    'folke/which-key.nvim',
    config = function()
        local normal = {
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

            ["<leader>u"]   = { name = "+util"                                                       },
            ["<leader>uz"]  = { ":ZenMode<CR>"                                , "Zen Mode"           },
            ["<leader>ut"]  = { "<cmd>Telescope builtin<CR>"                  , "Telescope"          },
            ["<leader>uf"]  = { "<cmd>Telescope find_files<CR>"               , "Find Files"         },
            ["<leader>ug"]  = { "<cmd>Telescope live_grep<CR>"                , "Grep Time"          },
            ["<leader>ub"]  = { "<cmd>Telescope buffers<CR>"                  , "Find Buffers"       },
            ["<leader>uh"]  = { "<cmd>Telescope help_tags<CR>"                , "Help Tags"          },
            ["<leader>us"]  = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Fuzzy Find"         },

            ["<leader>g"]   = { name = "+git"                                                        },
            ["<leader>go"]  = { ":CocCommand git.browserOpen<CR>"           , "Git Browser Open"     },
            ["<leader>gi"]  = { ":CocCommand git.chunkInfo<CR>"             , "Git Chunk Info"       },
            ["<leader>gc"]  = { "<cmd>Telescope git_commits<CR>"            , "Git Commits"          },
            ["<leader>gb"]  = { "<cmd>Telescope git_branches<CR>"           , "Git Branches"         },
            ["<leader>gs"]  = { "<cmd>Telescope git_status<CR>"             , "Git Status"           },

            ["<leader>c"]   = { name = "+code"                                                       },
            ["<leader>co"]  = { ":call v:lua.ShowDocs()<CR>"                , "Shows Docs"           },
            ["<leader>cn"]  = { "<Plug>(coc-diagnostic-prev)"               , "Diagnostic Prev"      },
            ["<leader>cm"]  = { "<Plug>(coc-diagnostic-next)"               , "Diagnostic Next"      },
            ["<leader>cd"]  = { "<Plug>(coc-definition)"                    , "Code Definition"      },
            ["<leader>cw"]  = { ":CocDiagnostic<CR>"                        , "Diagnostic Window"    },
            ["<leader>cy"]  = { "<Plug>(coc-type-definition)"               , "Code Type Def"        },
            ["<leader>ci"]  = { "<Plug>(coc-implementation)"                , "Code Impl"            },
            ["<leader>cr"]  = { "<Plug>(coc-references)"                    , "Code Ref"             },
            ["<leader>ca"]  = { "<Plug>(coc-codeaction)"                    , "Code Action"          },
            ["<leader>cf"]  = { "<Plug>(coc-fix-current)"                   , "Auto Fix"             },

            ["<leader>cl"]  = { name = "+list"                                                       },
            ["<leader>cld"] = { ":<C-u>CocList diagnostics<CR>"             , "List Diagnostics"     },
            ["<leader>clo"] = { ":<C-u>CocList outline<CR>"                 , "Current Doc Symbols"  },
            ["<leader>cls"] = { ":<C-u>CocList -I symbols<CR>"              , "Workspace Symbols"    },

            ["gc"]          = { ":CommentToggle<CR>"                        , "Comment Line"         },

            ["<C-f>"]       = { 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"' , "Scroll Down" , expr = true },
            ["<C-b>"]       = { 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"' , "Scroll Up"   , expr = true },
        }

        local visual = {
            ["gc"]    = { ":CommentToggle<CR>"                    , "Comment Block"  },

            ["<leader>s"]   = { "<Plug>(leap-forward-till)"       , "Leap Forward"   },
            ["<leader>S"]   = { "<Plug>(leap-backward-till)"      , "Leap Backward"  },

            ["<C-f>"] = { 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"' , "Scroll Down" , expr = true },
            ["<C-b>"] = { 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"' , "Scroll Up"   , expr = true },
        }

        local insert = {
            ["<CR>"]    = { [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]]     , "Report Enter" , expr = true },
            ["<TAB>"]   = { 'coc#pum#visible() ? coc#pum#next(1) : v:lua.CheckBackSpace() ? "<TAB>" : coc#refresh()' , "Report Tab"   , expr = true },
            ["<S-TAB>"] = { [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]]                                       , "Report S-Tab" , expr = true },
            ["<C-f>"]   = { 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"'                   , "Scroll Down"  , expr = true },
            ["<C-b>"]   = { 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"'                    , "Scroll Up"    , expr = true },
        }

        local termin = {
            ["<Esc>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true) , "Term Normal Mode" }
        }

        local wk = require("which-key")

        wk.register(normal, { mode = "n", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })
        wk.register(visual, { mode = "v", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })
        wk.register(insert, { mode = "i", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })
        wk.register(termin, { mode = "t", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })

        wk.setup({
            plugins = { marks = false },
            icons = {
                breadcrumb = ">>",
                separator = "->",
                group = "+",
            },
            triggers_blacklist = {}
        })
    end
}
