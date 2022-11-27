return {
    "windwp/nvim-autopairs",
    config = function()
        local np = require("nvim-autopairs")
        np.setup()
        local rule = require("nvim-autopairs.rule")
        np.add_rule(rule("<", ">"))
        np.add_rule(rule("|", "|"))

        V.CompletionConfirm = function()
            if vim.fn["coc#pum#visible"]() ~= 0  then
                return vim.fn["coc#pum#confirm"]()
            else
                return np.autopairs_cr()
            end
        end
    end
}
