return {
    "windwp/nvim-autopairs",
    config = function()
        local np = require("nvim-autopairs")

        np.setup({ map_bs = false, map_cr = false })

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

        _Internal.CR = function()
            if vim.fn.pumvisible() ~= 0 then
                if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
                    return np.esc('<c-y>')
                else
                    return np.esc('<c-e>') .. np.autopairs_cr()
                end
            else
                return np.autopairs_cr()
            end
        end

        _Internal.BS = function()
            if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
                return np.esc('<c-e>') .. np.autopairs_bs()
            else
                return np.autopairs_bs()
            end
        end
    end
}
