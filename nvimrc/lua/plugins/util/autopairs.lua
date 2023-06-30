return {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
        local np = require("nvim-autopairs")
        np.setup({ map_cr = false })
        local rule = require("nvim-autopairs.rule")
        local cond = require('nvim-autopairs.conds')

        for _, pair in ipairs(_G.V.add_pairs) do
            local r = rule(pair[1], pair[2])

            if pair.before     then r = r:with_pair(cond.before_regex(pair.before)) end
            if pair.after      then r = r:with_pair(cond.after_regex(pair.after)) end
            if pair.not_before then r = r:with_pair(cond.not_before_regex(pair.not_before)) end
            if pair.not_after  then r = r:with_pair(cond.not_after_regex(pair.not_after)) end
            if pair.use_regex  then r = r:use_regex(true) end

            np.add_rule(r)
        end

        _Internal.CompletionConfirm = function()
            if vim.fn["coc#pum#visible"]() ~= 0  then
                return vim.fn["coc#pum#confirm"]()
            else
                return np.autopairs_cr()
            end
        end
    end
}
