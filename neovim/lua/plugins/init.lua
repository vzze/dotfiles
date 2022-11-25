local M = {}

M.plugins = {
    'lewis6991/impatient.nvim',
    'wbthomason/packer.nvim',

    'xiyaowong/nvim-cursorword',
    'jghauser/mkdir.nvim',

    'nvim-lua/plenary.nvim',

    require("plugins.dirbuf"),
    require("plugins.aligner"),
    require("plugins.calculator"),
    require("plugins.autopairs"),
    require("plugins.wilder"),
    require("plugins.coc"),
    require("plugins.leap"),
    require("plugins.lualine"),
    require("plugins.which-key"),
    require("plugins.alpha"),
    require("plugins.treesitter"),
    require("plugins.auto-session"),
    require("plugins.tidy"),
    require("plugins.zen-mode"),
    require("plugins.twilight"),
    require("plugins.focus"),
    require("plugins.FTerm"),
    require("plugins.comment"),
    require("plugins.diffview"),
    require("plugins.telescope")
}

PluginNumber = #M.plugins

M.setup = function(use)
    use(M.plugins)
end

return M
