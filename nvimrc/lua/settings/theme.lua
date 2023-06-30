vim.api.nvim_create_autocmd("ColorScheme", {
    command = [[
        hi Pmenu guibg=NONE ctermbg=NONE ctermfg=3 guifg=3                                |
        hi PmenuSel guibg=NONE ctermbg=NONE ctermfg=10 guifg=10                           |
        hi PmenuSbar guibg=NONE ctermbg=NONE ctermfg=NONE guifg=NONE                      |
        hi PmenuThumb guibg=5 ctermbg=5 ctermfg=5 guifg=5                                 |
        hi CocFloating guibg=NONE ctermbg=NONE ctermfg=3 guifg=3                          |
        hi CocMenuSel guibg=NONE ctermbg=NONE ctermfg=10 guifg=10                         |
        hi CocInlayHint guibg=NONE ctermbg=NONE ctermfg=15 guifg=15                       |
        hi Conceal guibg=NONE ctermbg=NONE ctermfg=1 guifg=1                              |
        hi MatchParen guibg=NONE ctermbg=NONE ctermfg=15 guifg=15                         |
        hi Folded guibg=NONE ctermbg=NONE ctermfg=5 guifg=5                               |
        hi FoldColumn guibg=NONE ctermbg=NONE ctermfg=5 guifg=5                           |
        hi DiffAdd ctermbg=NONE guifg=NONE                                                |
        hi VertSplit cterm=NONE gui=NONE                                                  |
        hi SignColumn ctermbg=NONE guibg=NONE                                             |
        hi Normal guibg=NONE ctermbg=NONE ctermfg=13 guifg=13                             |
        hi EndOfBuffer guibg=NONE ctermbg=NONE ctermfg=NONE guifg=NONE                    |
        hi CursorWord cterm=underline gui=underline                                       |
        hi CursorLineNr cterm=NONE gui=NONE                                               |
        hi CursorLine cterm=none gui=none ctermbg=none ctermfg=none guibg=none guifg=none |
        hi CursorColumn ctermfg=11 ctermbg=NONE guifg=11 guibg=NONE                       |
        hi Constant guibg=NONE ctermbg=NONE ctermfg=6 guifg=6                             |
        hi Number guibg=NONE ctermbg=NONE ctermfg=12 guifg=12                             |
        hi Special guibg=NONE ctermbg=NONE ctermfg=11 guifg=11                            |
        hi SpecialChar guibg=NONE ctermbg=NONE ctermfg=3 guifg=3                          |
        hi String guibg=NONE ctermbg=NONE ctermfg=6 guifg=6                               |
        hi Type cterm=italic ctermfg=10 gui=italic guifg=10                               |
        hi Keyword cterm=italic ctermfg=11 gui=italic guifg=11                            |
        hi PreProc cterm=italic ctermfg=12 gui=italic guifg=12                            |
        hi Todo ctermfg=11 ctermbg=NONE guifg=11 guibg=NONE                               |
        hi Visual ctermfg=NONE ctermbg=8 guifg=NONE guibg=8                               |
        hi GSDiffAdd ctermfg=2 ctermbg=NONE guifg=2 guibg=NONE                            |
        hi GSDiffChange ctermfg=5 ctermbg=NONE guifg=5 guibg=NONE                         |
        hi GSDiffDelete ctermfg=1 ctermbg=NONE guifg=1 guibg=NONE                         |
        hi GSDiffText ctermfg=6 ctermbg=NONE guifg=6 guibg=NONE                           |
        hi DiffAdd ctermfg=15 ctermbg=2 guifg=15 guibg=2                                  |
        hi DiffChange ctermfg=15 ctermbg=5 guifg=15 guibg=5                               |
        hi DiffDelete ctermfg=15 ctermbg=1 guifg=15 guibg=1                               |
        hi DiffText ctermfg=15 ctermbg=6 guifg=15 guibg=6                                 |
        hi StatusLine cterm=NONE ctermfg=13 ctermbg=NONE                                  |
        hi StatusLineNC cterm=NONE ctermfg=13 ctermbg=NONE                                |
        hi TabLineFill cterm=NONE gui=NONE                                                |
        hi Twilight ctermfg=8
    ]]
})

vim.api.nvim_command([[colorscheme ]] .. _G.V.colorscheme)
