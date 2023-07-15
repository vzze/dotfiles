V.mappings.lsp = {
    normal = {
        ["<leader>l"] =  { name = "+lsp" },
        ["<leader>lD"] = { vim.lsp.buf.declaration    , "Declaration"      },
        ["<leader>ld"] = { vim.lsp.buf.definition     , "Definition"       },
        ["<leader>lt"] = { vim.lsp.buf.type_definition, "Type Definition"  },
        ["<leader>li"] = { vim.lsp.buf.implementation , "Implementation"   },
        ["<leader>lK"] = { vim.lsp.buf.hover          , "Hover"            },
        ["<leader>la"] = { vim.lsp.buf.code_action    , "Code Action"      },
        ["<leader>ls"] = { vim.lsp.buf.signature_help , "Signature Help"   },
        ["<leader>lr"] = { vim.lsp.buf.references     , "References"       },
        ["<leader>ln"] = { vim.diagnostic.goto_next   , "Next Diagnostic"  },
        ["<leader>lN"] = { vim.diagnostic.goto_prev   , "Prev Diagnostic"  },
        ["<leader>lo"] = { vim.diagnostic.open_float  , "Diagnostic Float" }
    },
    visual = {},
    insert = {},
    terminal = {}
}
