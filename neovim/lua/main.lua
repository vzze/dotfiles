local M = {}

M.setup = function()
    require("plugins/plugins").setup()
    require("settings").setup()
    require("functions")
end

return M
