return {
    'folke/which-key.nvim',
    event = "VeryLazy",
    config = function()
        local wk = require("which-key")

        wk.register(V.mappings.global.normal  , { mode = "n", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })
        wk.register(V.mappings.global.visual  , { mode = "v", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })
        wk.register(V.mappings.global.insert  , { mode = "i", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })
        wk.register(V.mappings.global.terminal, { mode = "t", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })

        wk.setup({
            plugins = { marks = false, registers = false },
            icons = {
                breadcrumb = ">>",
                separator = "->",
                group = "+",
            },
            triggers_blacklist = {}
        })
    end
}
