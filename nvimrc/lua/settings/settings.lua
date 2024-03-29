for key, value in pairs(V.providers) do
    if value == true then
        vim.api.nvim_set_var("loaded_" .. key .. "_provider", 1)
    else
        vim.api.nvim_set_var("loaded_" .. key .. "_provider", 0)
    end
end

for key, value in pairs(V.vim_settings) do
    vim.opt[key] = value
end

vim.api.nvim_create_autocmd("FileType", {
    command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
})

vim.api.nvim_command([[autocmd BufRead,BufNewFile *.fell set filetype=fell]])

vim.api.nvim_command([[set laststatus=1]])

vim.api.nvim_command([[autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2]])
