return {
    "windwp/nvim-autopairs",
    config = function()
        local np = require("nvim-autopairs")
        np.setup()
        local rule = require("nvim-autopairs.rule")
        np.add_rule(rule("<", ">"))
        np.add_rule(rule("|", "|"))
    end
}
