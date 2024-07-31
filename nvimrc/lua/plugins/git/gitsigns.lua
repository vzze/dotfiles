return {
    'lewis6991/gitsigns.nvim',
    event = "VeryLazy",
    config = function()
        require('gitsigns').setup({
            -- same explanation as in plugins.lsp.config
            -- as to why i cant use bufnr for jack
            on_attach = function(_ --[[bufnr]])
                local wk = require("which-key")

                wk.add(V.mappings.git)
            end
        })
    end
}
