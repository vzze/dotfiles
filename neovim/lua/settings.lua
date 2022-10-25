local M = {}

M.globals = function()
    local gset = vim.api.nvim_set_var

    gset("cursorword_disable_at_startup" , false)
    gset("cursorword_min_width"          , 2    )

    gset("VM_set_statusline"             , 0    )

    gset("loaded_perl_provider"          , 0    )
    gset("loaded_ruby_provider"          , 0    )
end

M.settings = function()
    vim.o.number = true
    vim.o.relativenumber = true
    vim.o.expandtab = true
    vim.o.tabstop = 8
    vim.o.shiftwidth = 4
    vim.o.smarttab = true
    vim.o.softtabstop = 1
    vim.o.mouse = 'a'
    vim.o.encoding = "UTF-8"
    vim.o.clipboard = vim.o.clipboard .. "unnamedplus"
    vim.o.signcolumn = "yes"
    vim.o.completeopt = "menu,preview"
    vim.o.hlsearch = true
    vim.o.updatetime = 300
    vim.o.timeoutlen = 500
    vim.o.backup = false
    vim.o.ruler = false
    vim.o.writebackup = false
    vim.o.fillchars = "vert: "
    vim.o.cmdheight = "0"
    vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

    vim.cmd("colorscheme default")
end

M.autocmd = function()
    vim.cmd([[hi Pmenu guibg=NONE ctermbg=NONE ctermfg=3 guifg=3]])
    vim.cmd([[hi PmenuSel guibg=NONE ctermbg=NONE ctermfg=10 guifg=10]])
    vim.cmd([[hi CocFloating guibg=NONE ctermbg=NONE ctermfg=3 guifg=3]])
    vim.cmd([[hi CocMenuSel guibg=NONE ctermbg=NONE ctermfg=10 guifg=10]])
    vim.cmd([[hi CocInlayHint guibg=NONE ctermbg=NONE ctermfg=15 guifg=15]])
    vim.cmd([[hi Conceal guibg=NONE ctermbg=NONE ctermfg=1 guifg=1]])
    vim.cmd([[hi MatchParen guibg=NONE ctermbg=NONE ctermfg=15 guifg=15]])

    vim.cmd([[hi DiffAdd ctermbg=NONE guifg=NONE]])
    vim.cmd([[hi VertSplit cterm=NONE gui=NONE]])
    vim.cmd([[hi SignColumn ctermbg=NONE guibg=NONE]])
    vim.cmd([[hi Normal guibg=NONE ctermbg=NONE ctermfg=13 guifg=13]])
    vim.cmd([[hi EndOfBuffer guibg=NONE ctermbg=NONE ctermfg=NONE guifg=NONE]])

    vim.cmd([[hi CursorWord cterm=underline gui=underline]])
    vim.cmd([[hi CursorLineNr cterm=NONE gui=NONE]])
    vim.cmd([[hi CursorLine cterm=none gui=none ctermbg=none ctermfg=none guibg=none guifg=none]])

    vim.cmd([[hi Constant guibg=NONE ctermbg=NONE ctermfg=6 guifg=6]])
    vim.cmd([[hi Number guibg=NONE ctermbg=NONE ctermfg=12 guifg=12]])
    vim.cmd([[hi Special guibg=NONE ctermbg=NONE ctermfg=11 guifg=11]])
    vim.cmd([[hi SpecialChar guibg=NONE ctermbg=NONE ctermfg=3 guifg=3]])
    vim.cmd([[hi String guibg=NONE ctermbg=NONE ctermfg=6 guifg=6]])
    vim.cmd([[hi Type cterm=italic ctermfg=10 gui=italic guifg=10]])
    vim.cmd([[hi Keyword cterm=italic ctermfg=11 gui=italic guifg=11]])
    vim.cmd([[hi PreProc cterm=italic ctermfg=12 gui=italic guifg=12]])

    vim.cmd([[hi Twilight ctermfg=8]])

    vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])
    vim.cmd([[autocmd BufEnter * set signcolumn=yes]])

    vim.cmd([[autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2]])
    vim.cmd([[autocmd User AlphaReady set laststatus=0 | autocmd BufUnload <buffer> set laststatus=2]])
end

M.setup = function()
    M.globals()
    M.settings()
    M.autocmd()
end

return M
