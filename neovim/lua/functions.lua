function MultipleCursorsBefore()
    if vim.fn.exists(":CocDisable") == 2 then
        vim.cmd("CocDisable")
    end
end

function MultipleCursorsAfter()
    if vim.fn.exists(":CocEnable") == 2 then
        vim.cmd("CocEnable")
    end
end

function UpdateGitStatus()
    vim.g.airline_section_b = "%{get(g:,'coc_git_status','')}"
end

function CheckBackSpace()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

function ShowDocs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
