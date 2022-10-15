local M = {}

M.setup = function()
    require("plugins/plugins").setup()
    require("settings").setup()
end

return M
