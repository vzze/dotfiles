vim.loader.enable();

require("v")
require("v.add_pairs")
require("v.splash_screen")
require("v.terminal")
require("v.post_setup_callback")
require("v.providers")
require("v.colorscheme")
require("v.vim_settings")

require("v.mappings")
require("v.mappings.global")
require("v.mappings.git")
require("v.mappings.lsp")

require("v.statusline")
require("v.statusline.nier")
require("v.statusline.pinky")

require("v.lsp")
require("v.lsp.lua_ls")
require("v.lsp.clangd")

require("config")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(require("plugins"), {
    ui = {
        icons = {
            cmd = "cmd",
            config = "cfg",
            event = "ev",
            ft = "ft",
            init = "ini",
            keys = "key",
            plugin = "plug",
            runtime = "rt",
            source = "src",
            start = "st",
            task = "tk",
            lazy = "zZ",
        },
    },
})

require("settings")
