V.mappings.lsp = {
    normal = {
        ["\\l"]   =  { name = "+lsp" },
        ["\\lD"]  = { vim.lsp.buf.declaration    , "Declaration"      },
        ["\\ld"]  = { vim.lsp.buf.definition     , "Definition"       },
        ["\\lt"]  = { vim.lsp.buf.type_definition, "Type Definition"  },
        ["\\li"]  = { vim.lsp.buf.implementation , "Implementation"   },
        ["\\lK"]  = { vim.lsp.buf.hover          , "Hover"            },
        ["\\la"]  = { vim.lsp.buf.code_action    , "Code Action"      },
        ["\\ls"]  = { vim.lsp.buf.signature_help , "Signature Help"   },
        ["\\lr"]  = { vim.lsp.buf.references     , "References"       },
        ["\\ln"]  = { vim.diagnostic.goto_next   , "Next Diagnostic"  },
        ["\\lN"]  = { vim.diagnostic.goto_prev   , "Prev Diagnostic"  },
        ["\\lo"]  = { vim.diagnostic.open_float  , "Diagnostic Float" },

        ["\\ll"]  = { name = "+lists" },

        ["\\llr"] = { "<cmd>TroubleToggle lsp_references<CR>"       , "List References"            },
        ["\\lli"] = { "<cmd>TroubleToggle lsp_implementations<CR>"  , "List Implementations"       },
        ["\\lld"] = { "<cmd>TroubleToggle lsp_definitions<CR>"      , "List Definitions"           },
        ["\\llt"] = { "<cmd>TroubleToggle lsp_type_definitions<CR>" , "List Type Definitions"      },
        ["\\llq"] = { "<cmd>TroubleToggle quickfix<CR>"             , "List Quickfixes"            },
        ["\\lll"] = { "<cmd>TroubleToggle loclist<CR>"              , "List Locations"             },
        ["\\llo"] = { "<cmd>TroubleToggle document_diagnostics<CR>" , "List Document Diagnostics"  },
        ["\\llO"] = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "List Workspace Diagnostics" },
    },

    visual = {},
    insert = {},
    terminal = {}
}
