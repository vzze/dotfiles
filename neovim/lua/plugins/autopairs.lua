return {
    "windwp/nvim-autopairs",
    config = function()
        local np = require("nvim-autopairs")
        np.setup()
        local rule = require("nvim-autopairs.rule")

        for _, pair in ipairs(_G.V.add_pairs) do
            np.add_rule(rule(pair[1], pair[2]))
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
