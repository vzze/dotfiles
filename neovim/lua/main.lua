local M = {}

M.setup = function()
    require("plugins/plugins").setup()
    require("globals").setup()
    require("settings").setup()
    require("functions")
end

return M
