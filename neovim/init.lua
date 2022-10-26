pcall(require, "impatient")

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

local packer = require("packer")

packer.startup(require("plugins/plugins").setup)

if packer_bootstrap then
   packer.sync()
end

require("settings").setup()
