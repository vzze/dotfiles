return {
    'neoclide/coc.nvim',
    build = ":CocUpdate",
    branch = 'release',
    event = "VeryLazy",
    config = function()
        _Internal.CheckBackSpace = function()
            local col = vim.fn.col('.') - 1
            ---@diagnostic disable-next-line: undefined-field
            return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
        end

        _Internal.ShowDocs = function()
            ---@diagnostic disable-next-line: missing-parameter
            local cw = vim.fn.expand('<cword>')
            if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
                vim.api.nvim_command('h ' .. cw)
            elseif vim.api.nvim_eval('coc#rpc#ready()') then
                vim.fn.CocActionAsync('doHover')
            else
                vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
            end
        end
    end
}
