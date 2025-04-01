V.mappings.lsp = function(buf)
    return {
        { "<LocalLeader>l" , group = "lsp", buffer = buf },

        { "<LocalLeader>lD", vim.lsp.buf.declaration                          , desc = "Declaration"     , buffer = buf },
        { "<LocalLeader>ld", vim.lsp.buf.definition                           , desc = "Definition"      , buffer = buf },
        { "<LocalLeader>lt", vim.lsp.buf.type_definition                      , desc = "Type Definition" , buffer = buf },
        { "<LocalLeader>li", vim.lsp.buf.implementation                       , desc = "Implementation"  , buffer = buf },
        { "<LocalLeader>lK", vim.lsp.buf.hover                                , desc = "Hover"           , buffer = buf },
        { "<LocalLeader>la", vim.lsp.buf.code_action                          , desc = "Code Action"     , buffer = buf },
        { "<LocalLeader>ls", vim.lsp.buf.signature_help                       , desc = "Signature Help"  , buffer = buf },
        { "<LocalLeader>lr", vim.lsp.buf.references                           , desc = "References"      , buffer = buf },
        { "<LocalLeader>lo", vim.diagnostic.open_float                        , desc = "Diagnostic Float", buffer = buf },

        {
            "<LocalLeader>ln",
            function()
                vim.diagnostic.jump({ count = 1 , float = true })
            end, desc = "Next Diagnostic" , buffer = buf
        },

        {
            "<LocalLeader>lN",
            function()
                vim.diagnostic.jump({ count = -1, float = true })
            end, desc = "Prev Diagnostic" , buffer = buf
        }
    }
end
