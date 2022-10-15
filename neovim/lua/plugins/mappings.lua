local M = {}

function MultipleCursorsBefore()
    if vim.fn.exists(":CocDisable") == 2 then
        vim.cmd("CocDisable")
    end
end

function MultipleCursorsAfter()
    if vim.fn.exists(":CocEnable") == 2 then
        vim.cmd("CocEnable")
    end
end

function CheckBackSpace()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

function ShowDocs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

function Surround(br2, br1)
    local tup1 = vim.api.nvim_buf_get_mark(0, "<")
    local tup2 = vim.api.nvim_buf_get_mark(0, ">")
    local txt = vim.api.nvim_buf_get_lines(0, tup1[1] - 1, tup2[1], true)

    txt[#txt] = txt[#txt]:sub(0, tup2[2]) .. br1 .. txt[#txt]:sub(tup2[2] + 1)
    txt[1] = txt[1]:sub(0, tup1[2]) .. br2 .. txt[1]:sub(tup1[2] + 1)
    vim.api.nvim_buf_set_lines(0, tup1[1] - 1, tup2[1], true, txt)
end

function SurroundLine(br2, br1)
    local txt = vim.api.nvim_get_current_line()
    txt = br2 .. txt .. br1
    vim.api.nvim_set_current_line(txt);
end

function SurroundWord(br2, br1)
    local txt = vim.api.nvim_get_current_line()
    local tup = vim.api.nvim_win_get_cursor(0)
    local col = tup[2]
    local i = txt:find("%W", col + 1)
    if i == nil then
       i = #txt + 1
    end
    local rev = txt:reverse()
    local i2 = col + (math.floor(#txt / 2) - col) * 2
    i2 = rev:find("%W", i2 + 1)
    if i2 == nil then
       i2 = #rev + 1
    end
    rev = rev:sub(0, i2 - 1) .. br2 .. rev:sub(i2)
    txt = rev:reverse()
    txt = txt:sub(0, i) .. br1 .. txt:sub(i + 1)
    vim.api.nvim_set_current_line(txt);
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
    ["<leader>uz"]  = { ":ZenMode<CR>"                               , "Zen Mode"              },

    ["<leader>ug"]  = { name = "+git"                                                          },
    ["<leader>ugt"] = { ":CocCommand git.browserOpen<CR>"            , "Git Info Location"     },
    ["<leader>ugc"] = { ":CocCommand git.chunkInfo<CR>"              , "Git Chunk Info"        },

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

    ["g"]           = { name = "+Text Edit"                                                    },
    ["gc"]          = { ":CommentToggle<CR>"                             , "Comment Line"      },

    ["gl"]          = { name = "+Line Edit"                                                    },
    ["gl)"]         = { ":<C-u>call v:lua.SurroundLine('(', ')')<CR>"    , "Surround Line"     },
    ["gl]"]         = { ":<C-u>call v:lua.SurroundLine('[', ']')<CR>"    , "Surround Line"     },
    ["gl}"]         = { ":<C-u>call v:lua.SurroundLine('{', '}')<CR>"    , "Surround Line"     },
    ["gl>"]         = { ":<C-u>call v:lua.SurroundLine('<', '>')<CR>"    , "Surround Line"     },
    ["gl'"]         = { [[:<C-u>call v:lua.SurroundLine("'", "'")<CR>]]  , "Surround Line"     },
    ["gl`"]         = { [[:<C-u>call v:lua.SurroundLine("`", "`")<CR>]]  , "Surround Line"     },
    ['gl"']         = { [[:<C-u>call v:lua.SurroundLine('"', '"')<CR>]]  , "Surround Line"     },

    ["gw"]          = { name = "+Word Edit"                                                    },
    ["gw)"]         = { ":<C-u>call v:lua.SurroundWord('(', ')')<CR>"    , "Surround Word"     },
    ["gw]"]         = { ":<C-u>call v:lua.SurroundWord('(', ')')<CR>"    , "Surround Word"     },
    ["gw}"]         = { ":<C-u>call v:lua.SurroundWord('(', ')')<CR>"    , "Surround Word"     },
    ["gw'"]         = { [[:<C-u>call v:lua.SurroundWord("'", "'")<CR>]]  , "Surround Word"     },
    ["gw`"]         = { [[:<C-u>call v:lua.SurroundWord("`", "`")<CR>]]  , "Surround Word"     },
    ['gw"']         = { [[:<C-u>call v:lua.SurroundWord('"', '"')<CR>]]  , "Surround Word"     },
}

M.visual = {
    ["g"]  = { name = "+Text Edit"                                                    },
    ["gc"] = { ":'<,'>CommentToggle<CR>"                    , "Comment Block"         },
    ["g)"] = { ":<C-u>call v:lua.Surround('(', ')')<CR>"    , "Surround Block"        },
    ["g]"] = { ":<C-u>call v:lua.Surround('[', ']')<CR>"    , "Surround Block"        },
    ["g}"] = { ":<C-u>call v:lua.Surround('{', '}')<CR>"    , "Surround Block"        },
    ["g>"] = { ":<C-u>call v:lua.Surround('<', '>')<CR>"    , "Surround Block"        },
    ["g'"] = { [[:<C-u>call v:lua.Surround("'", "'")<CR>]]  , "Surround Block"        },
    ["g`"] = { [[:<C-u>call v:lua.Surround("`", "`")<CR>]]  , "Surround Block"        },
    ['g"'] = { [[:<C-u>call v:lua.Surround('"', '"')<CR>]]  , "Surround Block"        }

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
