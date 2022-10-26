local ensure_packer = function()
    local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    ---@diagnostic disable-next-line: missing-parameter
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

local plugs = require("plugins/plugins")

require("packer").startup(plugs.setup)

if packer_bootstrap then
   require("packer").sync()
end

require("plugins/other").setup()
require("plugins/statusline").setup()
require("plugins/mappings").setup()
require("plugins/splash_screen").setup(#plugs.plugins)

require("settings").setup()
