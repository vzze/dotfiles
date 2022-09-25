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
    local ln  = vim.fn.getline(".")
    return col == 0 or string.find(tostring(ln), "%s")
end

function ShowDocs()
    if vim.fn.CocAction('hasProvider', 'hover') then
        vim.cmd("call CocActionAsync('doHover')")
    else
        vim.cmd("call feedkeys('K', 'in')")
    end
end
