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

function Surround(br2, br1)
    local tup1 = vim.api.nvim_buf_get_mark(0, "<")
    local tup2 = vim.api.nvim_buf_get_mark(0, ">")
    local txt = vim.api.nvim_buf_get_lines(0, tup1[1] - 1, tup2[1], true)

    txt[#txt] = txt[#txt]:sub(0, tup2[2]) .. br1 .. txt[#txt]:sub(tup2[2] + 1)
    txt[1] = txt[1]:sub(0, tup1[2]) .. br2 .. txt[1]:sub(tup1[2] + 1)
    vim.api.nvim_buf_set_lines(0, tup1[1] - 1, tup2[1], true, txt)
end
