local M = {}

M.globals = function()
    local gset = vim.api.nvim_set_var

    gset("airline_powerline_fonts"                , 0                                )
    gset("airline#extensions#tabline#enabled"     , 1                                )
    gset("airline#extensions#coc#enabled"         , 1                                )
    gset("airline_theme"                          , 'purify'                         )
    gset("airline_section_b"                      , "%{get(g:,'coc_git_status','')}" )

    gset("airline#extensions#tagbar#enabled"      , 1                                )
    gset("airline#extensions#tagbar#searchmethod" , 'scoped-stl'                     )
    gset("airline#extensions#tagbar#flags"        , 'fs'                             )

    gset("cursorword_disable_at_startup"          , false                            )

    gset("loaded_perl_provider"                   , 0                                )
    gset("loaded_ruby_provider"                   , 0                                )
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

    vim.cmd("colorscheme default")
end

M.autocmd = function()
    vim.cmd([[autocmd vimenter * hi Pmenu guibg=NONE ctermbg=NONE ctermfg=3 guifg=3]])
    vim.cmd([[autocmd vimenter * hi PmenuSel guibg=NONE ctermbg=NONE ctermfg=121 guifg=121]])
    vim.cmd([[autocmd vimenter * hi CocFloating guibg=NONE ctermbg=NONE ctermfg=3 guifg=3]])
    vim.cmd([[autocmd vimenter * hi CocMenuSel guibg=NONE ctermbg=NONE ctermfg=121 guifg=121]])
    vim.cmd([[autocmd vimenter * hi CocInlayHint guibg=NONE ctermbg=NONE ctermfg=11 guifg=11]])
    vim.cmd([[autocmd vimenter * hi Conceal guibg=NONE ctermbg=NONE ctermfg=1 guifg=1]])
    vim.cmd([[autocmd vimenter * hi MatchParen guibg=NONE ctermbg=NONE ctermfg=15 guifg=15]])

    vim.cmd([[autocmd vimenter * hi DiffAdd ctermbg=NONE guifg=NONE]])
    vim.cmd([[autocmd vimenter * hi VertSplit cterm=NONE gui=NONE]])
    vim.cmd([[autocmd vimenter * hi SignColumn ctermbg=NONE guibg=NONE]])
    vim.cmd([[autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE ctermfg=7 guifg=7]])
    vim.cmd([[autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE ctermfg=NONE guifg=NONE]])

    vim.cmd([[autocmd vimenter * hi CursorWord cterm=underline gui=underline]])
    vim.cmd([[autocmd vimenter * hi CursorLineNr cterm=NONE gui=NONE]])
    vim.cmd([[autocmd vimenter * hi CursorLine cterm=none gui=none ctermbg=none ctermfg=none guibg=none guifg=none]])

    vim.cmd([[autocmd vimenter * hi Constant guibg=NONE ctermbg=NONE ctermfg=6 guifg=6]])
    vim.cmd([[autocmd vimenter * hi Number guibg=NONE ctermbg=NONE ctermfg=12 guifg=12]])
    vim.cmd([[autocmd vimenter * hi Special guibg=NONE ctermbg=NONE ctermfg=11 guifg=11]])
    vim.cmd([[autocmd vimenter * hi SpecialChar guibg=NONE ctermbg=NONE ctermfg=3 guifg=3]])
    vim.cmd([[autocmd vimenter * hi String guibg=NONE ctermbg=NONE ctermfg=6 guifg=6]])
    vim.cmd([[autocmd vimenter * hi Type cterm=italic ctermfg=121 gui=italic guifg=121]])
    vim.cmd([[autocmd vimenter * hi Keyword cterm=italic ctermfg=11 gui=italic guifg=11]])
    vim.cmd([[autocmd vimenter * hi PreProc cterm=italic ctermfg=12 gui=italic guifg=12]])

    vim.cmd([[autocmd vimenter * hi Twilight ctermfg=8]])

    vim.cmd([[autocmd vimenter * TSEnable highlight]])

    vim.cmd([[autocmd User CocGitStatusChange call v:lua.UpdateGitStatus()]])

    vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])
    vim.cmd([[autocmd BufEnter * set signcolumn=yes]])

    vim.cmd([[autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2]])
    vim.cmd([[autocmd User AlphaReady set laststatus=0 | autocmd BufUnload <buffer> set laststatus=2]])
    vim.cmd([[autocmd User MultipleCursorsPre call v:lua.MultipleCursorsBefore()]])
    vim.cmd([[autocmd User MultipleCursorsPost call v:lua.MultipleCursorsAfter()]])
end

M.setup = function()
    M.globals()
    M.settings()
    M.autocmd()
end

return M
