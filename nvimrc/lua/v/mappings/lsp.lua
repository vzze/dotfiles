V.mappings.lsp = {
    { "\\l", group = "lsp", nowait = false, remap = false },

    { "\\lD", vim.lsp.buf.declaration    , desc = "Declaration"     , nowait = false, remap = false },
    { "\\ld", vim.lsp.buf.definition     , desc = "Definition"      , nowait = false, remap = false },
    { "\\lt", vim.lsp.buf.type_definition, desc = "Type Definition" , nowait = false, remap = false },
    { "\\li", vim.lsp.buf.implementation , desc = "Implementation"  , nowait = false, remap = false },
    { "\\lK", vim.lsp.buf.hover          , desc = "Hover"           , nowait = false, remap = false },
    { "\\la", vim.lsp.buf.code_action    , desc = "Code Action"     , nowait = false, remap = false },
    { "\\ls", vim.lsp.buf.signature_help , desc = "Signature Help"  , nowait = false, remap = false },
    { "\\lr", vim.lsp.buf.references     , desc = "References"      , nowait = false, remap = false },
    { "\\ln", vim.diagnostic.goto_next   , desc = "Next Diagnostic" , nowait = false, remap = false },
    { "\\lN", vim.diagnostic.goto_prev   , desc = "Prev Diagnostic" , nowait = false, remap = false },
    { "\\lo", vim.diagnostic.open_float  , desc = "Diagnostic Float", nowait = false, remap = false },

    -- will leave them in until i decide
    -- if i want trouble back or no

    -- { "\\ll", group = "lists", nowait = false, remap = false },
    --
    -- { "\\llr", "<cmd>TroubleToggle lsp_references<CR>"       , desc = "List References"           , nowait = false, remap = false },
    -- { "\\lli", "<cmd>TroubleToggle lsp_implementations<CR>"  , desc = "List Implementations"      , nowait = false, remap = false },
    -- { "\\lld", "<cmd>TroubleToggle lsp_definitions<CR>"      , desc = "List Definitions"          , nowait = false, remap = false },
    -- { "\\llt", "<cmd>TroubleToggle lsp_type_definitions<CR>" , desc = "List Type Definitions"     , nowait = false, remap = false },
    -- { "\\llq", "<cmd>TroubleToggle quickfix<CR>"             , desc = "List Quickfixes"           , nowait = false, remap = false },
    -- { "\\lll", "<cmd>TroubleToggle loclist<CR>"              , desc = "List Locations"            , nowait = false, remap = false },
    -- { "\\llo", "<cmd>TroubleToggle document_diagnostics<CR>" , desc = "List Document Diagnostics" , nowait = false, remap = false },
    -- { "\\llO", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "List Workspace Diagnostics", nowait = false, remap = false },
}
