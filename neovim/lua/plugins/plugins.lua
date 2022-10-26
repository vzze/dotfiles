local M = {}

M.plugins = {
    'lewis6991/impatient.nvim',
    'wbthomason/packer.nvim',

    'neoclide/coc.nvim',
    'xiyaowong/nvim-cursorword',
    'jghauser/mkdir.nvim',

    {
        'folke/which-key.nvim',
        config = function()
            require("plugins/mappings").setup()
        end,
        requires = {
            { 'max397574/better-escape.nvim' },
            { 'ggandor/leap.nvim' }
        }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            vim.api.nvim_create_autocmd("vimenter", {
                command = "TSEnable highlight"
            })
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require("plugins/statusline").setup()
        end
    },
    {
        'goolord/alpha-nvim',
        config = function()
            require("plugins/splash_screen").setup(PluginNumber)
        end
    },
    {
        'nacro90/numb.nvim',
        config = function()
            require("numb").setup()
        end
    },

    {
        'rmagatti/auto-session',
        opt = true,
        cmd = { "SaveSession", "RestoreSession" },
        config = function()
            require("auto-session").setup({
                log_level = 'none',
                auto_restore_enabled = false,
                auto_save_enabled = false,
            })
        end
    },

    {
        'elihunter173/dirbuf.nvim',
        opt = true,
        cmd = { "Dirbuf" }
    },
    {
        'mcauley-penney/tidy.nvim',
        event = "BufWritePre",
        opt = true,
        config = function ()
            require("tidy").setup()
        end
    },
    {
        'folke/zen-mode.nvim',
        opt = true,
        cmd = "ZenMode",
        config = function()
            require("zen-mode").setup({ window = { backdrop = 1, width = 1, height = 1 } })
        end
    },
    {
        'folke/twilight.nvim',
        opt = true,
        module = "twilight"
    },
    {
        'beauwilliams/focus.nvim',
        opt = true,
        cmd = { "FocusSplitLeft", "FocusSplitUp", "FocusSplitDown", "FocusSplitRight", "FocusSplitCycle" },
        config = function() require("focus").setup() end
    },
    {
        'numToStr/FTerm.nvim',
        opt = true,
        module = "FTerm",
        config = function()
            if vim.fn.has("unix") == 1 then
                require("FTerm").setup({ cmd = "bash" })
            elseif vim.fn.has("win32") == 1 then
                require("FTerm").setup({ cmd = "pwsh.exe" })
            end
        end
    },
    {
        'terrortylor/nvim-comment',
        opt = true,
        cmd = "CommentToggle",
        config = function()
            require("nvim_comment").setup({ comment_empty = false, create_mappings = false })
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        opt = true,
        cmd = "Telescope",
        requires = {
            { 'nvim-lua/plenary.nvim', opt = true, module = "plenary" }
        }
    }
}

PluginNumber = #M.plugins

M.setup = function(use)
    for _, plugin in pairs(M.plugins) do
        use(plugin)
    end
end

return M
