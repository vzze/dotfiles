local M = {}

M.setup = function()
    require('packer').startup(require("plugins/plugins").setup)
    require("settings").setup()
end

return M
