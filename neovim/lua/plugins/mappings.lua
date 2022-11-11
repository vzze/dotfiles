local M = {}

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

function Align(arg1, arg2, token)
    local lines = vim.api.nvim_buf_get_lines(0, arg1 - 1, arg2, true);

    local ind = {}

    for key, value in ipairs(lines) do
        local s = 0
        local e = 0
        ind[key] = {}
        s, e = string.find(value, token, s)
        while s ~= nil do
            table.insert(ind[key], s)
            s = e + 1
            s, e = string.find(value, token, s)
        end
    end

    local max = 0

    for _, value in ipairs(ind) do
        if max < #value then
            max = #value
        end
    end

    for _, value in ipairs(ind) do
        while #value ~= max do
            table.insert(value, -1)
        end
    end

    local str = ""

    for j = 1, #ind[1], 1 do
        local len_m = 0
        for _, value in ipairs(ind) do
            if len_m < value[j] then
                len_m = value[j]
            end
        end

        for key, value in ipairs(lines) do
            if ind[key][j] ~= -1 then
                for _ = 1, len_m - ind[key][j], 1 do
                    str = str .. " "
                end
                for x = j + 1, #ind[key], 1 do
                    if ind[key][x] ~= -1 then
                        ind[key][x] = ind[key][x] + len_m - ind[key][j]
                    end
                end
                lines[key] = string.sub(value, 0, ind[key][j] - 1) .. str .. string.sub(value, ind[key][j])
                str = ""
            end
        end
    end

    vim.api.nvim_buf_set_lines(0, arg1 - 1, arg2, true, lines)
end

M.normal = {
    ["q"]           = { ":SaveSession<CR> <Bar> :wqa<CR>"             , "gtfo asap"            },

    ["t"]           = { name = "+tabs"                                                         },
    ["th"]          = { ":tabprevious<CR>"                            , "Previous Tab"         },
    ["tl"]          = { ":tabnext<CR>"                                , "Next Tab"             },
    ["tn"]          = { ":tabnew<CR>"                                 , "New Tab"              },
    ["td"]          = { ":tabclose<CR>"                               , "Close Tab"            },
    ["te"]          = { "<cmd>lua require(\"FTerm\").toggle()<CR>"    , "Terminal"             },
    ["tf"]          = { ":Dirbuf <Bar> :DirbufSync<CR>"               , "File Editor"          },

    ["tq"]          = { ":q<CR>"                                      , "Close Split"          },
    ["tH"]          = { "<cmd>FocusSplitLeft<CR>"                     , "Split Left"           },
    ["tJ"]          = { "<cmd>FocusSplitDown<CR>"                     , "Split Down"           },
    ["tK"]          = { "<cmd>FocusSplitUp<CR>"                       , "Split Up"             },
    ["tL"]          = { "<cmd>FocusSplitRight<CR>"                    , "Split Right"          },
    ["tt"]          = { "<cmd>FocusSplitCycle<CR>"                    , "Cycle Splits"         },
    ["tT"]          = { "<cmd>FocusSplitCycle reverse<CR>"            , "Reverse Cycle Splits" },
    ["tr"]          = { name = "+Switch CC and HH"                                             },
    ["trc"]         = { ":CocCommand clangd.switchSourceHeader<CR>"   , "Switch CC and HH"     },

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

M.visual = {
    ["gc"]    = { ":'<,'>CommentToggle<CR>"                    , "Comment Block"  },

    ["<C-f>"] = { 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"' , "Scroll Down" , expr = true },
    ["<C-b>"] = { 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"' , "Scroll Up"   , expr = true },
}

M.insert = {
    ["<CR>"]    = { [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]]     , "Report Enter" , expr = true },
    ["<TAB>"]   = { 'coc#pum#visible() ? coc#pum#next(1) : v:lua.CheckBackSpace() ? "<TAB>" : coc#refresh()' , "Report Tab"   , expr = true },
    ["<S-TAB>"] = { [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]]                                       , "Report S-Tab" , expr = true },
    ["<C-f>"]   = { 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"'                   , "Scroll Down"  , expr = true },
    ["<C-b>"]   = { 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"'                    , "Scroll Up"    , expr = true },
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

    require("leap").set_default_keymaps()

    vim.api.nvim_create_user_command("Align", "call v:lua.Align(<line1>, <line2>, <f-args>)", { ["range"] = 1, ["nargs"] = 1 })

    vim.api.nvim_create_user_command("SS", "call v:lua.Surround(<f-args>)", { ["range"] = 1, ["nargs"] = "*" })
    vim.api.nvim_create_user_command("SW", "call v:lua.SurroundWord(<f-args>)", { ["nargs"] = "*" });
    vim.api.nvim_create_user_command("SL", "call v:lua.SurroundLine(<f-args>)", { ["nargs"] = "*" });

    local wk = require("which-key")

    wk.register(M.normal, { mode = "n", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })
    wk.register(M.visual, { mode = "v", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })
    wk.register(M.insert, { mode = "i", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })
    wk.register(M.termin, { mode = "t", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })

    wk.setup({
        plugins = {
            marks = false
        },
        icons = {
            breadcrumb = ">>",
            separator = "->",
            group = "+",
        },
        triggers_blacklist = {}
    })
end

return M;
