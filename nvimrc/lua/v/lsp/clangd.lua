V.lsp["clangd"] = {
    on_attach = function(client, bufnr)
        local wk = require("which-key")

        wk.register(V.mappings.lsp.normal  , { mode = "n", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })
        wk.register(V.mappings.lsp.visual  , { mode = "v", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })
        wk.register(V.mappings.lsp.insert  , { mode = "i", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })
        wk.register(V.mappings.lsp.terminal, { mode = "t", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })

        wk.register({
            ["sr"] = { "<cmd>ClangdSwitchSourceHeader<CR>", "Switch CC & HH" }
        }, { mode = "n", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })

        require("clangd_extensions.inlay_hints").setup_autocmd()
        require("clangd_extensions.inlay_hints").set_inlay_hints()

        client.server_capabilities.semanticTokensProvider = nil
    end
}
