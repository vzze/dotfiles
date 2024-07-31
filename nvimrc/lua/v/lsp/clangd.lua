V.lsp["clangd"] = {
    -- same explanation as in plugins.lsp.config
    -- as to why i cant use bufnr for jack
    on_attach = function(client, _ --[[bufnr]])
        local wk = require("which-key")

        wk.add(V.mappings.lsp)

        wk.add({
            { "sr", "<cmd>ClangdSwitchSourceHeader<CR>", desc = "Switch CC & HH", nowait = false, remap = false }
        })

        require("clangd_extensions.inlay_hints").setup_autocmd()
        require("clangd_extensions.inlay_hints").set_inlay_hints()

        client.server_capabilities.semanticTokensProvider = nil
    end
}
