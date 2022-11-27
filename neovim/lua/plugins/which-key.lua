return {
    'folke/which-key.nvim',
    config = function()
        local wk = require("which-key")

        wk.register(V.mappings.normal  , { mode = "n", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })
        wk.register(V.mappings.visual  , { mode = "v", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })
        wk.register(V.mappings.insert  , { mode = "i", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })
        wk.register(V.mappings.terminal, { mode = "t", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })

        wk.setup({
            plugins = { marks = false },
            icons = {
                breadcrumb = ">>",
                separator = "->",
                group = "+",
            },
            triggers_blacklist = {}
        })
    end
}
