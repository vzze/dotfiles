V.mappings.lsp = {
    normal = {
        ["<leader>l"]   =  { name = "+lsp" },
        ["<leader>lD"]  = { vim.lsp.buf.declaration    , "Declaration"      },
        ["<leader>ld"]  = { vim.lsp.buf.definition     , "Definition"       },
        ["<leader>lt"]  = { vim.lsp.buf.type_definition, "Type Definition"  },
        ["<leader>li"]  = { vim.lsp.buf.implementation , "Implementation"   },
        ["<leader>lK"]  = { vim.lsp.buf.hover          , "Hover"            },
        ["<leader>la"]  = { vim.lsp.buf.code_action    , "Code Action"      },
        ["<leader>ls"]  = { vim.lsp.buf.signature_help , "Signature Help"   },
        ["<leader>lr"]  = { vim.lsp.buf.references     , "References"       },
        ["<leader>ln"]  = { vim.diagnostic.goto_next   , "Next Diagnostic"  },
        ["<leader>lN"]  = { vim.diagnostic.goto_prev   , "Prev Diagnostic"  },
        ["<leader>lo"]  = { vim.diagnostic.open_float  , "Diagnostic Float" },

        ["<leader>ll"]  = { name = "+lists" },

        ["<leader>llr"] = { "<cmd>TroubleToggle lsp_references<CR>"       , "List References"            },
        ["<leader>lli"] = { "<cmd>TroubleToggle lsp_implementations<CR>"  , "List Implementations"       },
        ["<leader>lld"] = { "<cmd>TroubleToggle lsp_definitions<CR>"      , "List Definitions"           },
        ["<leader>llt"] = { "<cmd>TroubleToggle lsp_type_definitions<CR>" , "List Type Definitions"      },
        ["<leader>llq"] = { "<cmd>TroubleToggle quickfix<CR>"             , "List Quickfixes"            },
        ["<leader>lll"] = { "<cmd>TroubleToggle loclist<CR>"              , "List Locations"             },
        ["<leader>llo"] = { "<cmd>TroubleToggle document_diagnostics<CR>" , "List Document Diagnostics"  },
        ["<leader>llO"] = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "List Workspace Diagnostics" },
    },
    visual = {},
    insert = {},
    terminal = {}
}
