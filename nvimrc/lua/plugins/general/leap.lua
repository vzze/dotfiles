return {
    "ggandor/leap.nvim",
    config = function()
        local leap = require("leap")
        leap.opts.highlight_unlabeled_phase_one_targets = true
    end
}
