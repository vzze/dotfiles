autocmd vimenter * hi SignColumn ctermbg=NONE
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
autocmd vimenter * hi DiffAdd ctermbg=NONE guibg=NONE
autocmd vimenter * hi VertSplit cterm=NONE gui=NONE

autocmd vimenter * hi Pmenu guibg=NONE ctermbg=NONE ctermfg=3 guifg=3
autocmd vimenter * hi PmenuSel guibg=NONE ctermbg=NONE ctermfg=121 guifg=121
autocmd vimenter * hi CocFloating guibg=NONE ctermbg=NONE ctermfg=3 guifg=3
autocmd vimenter * hi CocMenuSel guibg=NONE ctermbg=NONE ctermfg=121 guifg=121

autocmd vimenter * hi CursorLineNr cterm=NONE
autocmd vimenter * hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guifg=NONE

autocmd vimenter * hi Type cterm=italic ctermfg=121 gui=italic guifg=121
autocmd vimenter * hi Keyword cterm=italic ctermfg=11 gui=italic guifg=11
autocmd vimenter * hi PreProc cterm=italic ctermfg=12 gui=italic guifg=12

autocmd vimenter * hi Twilight ctermfg=8

autocmd vimenter * TSEnable highlight

autocmd User CocGitStatusChange call Update_git_status()

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
autocmd User AlphaReady set laststatus=0 | autocmd BufUnload <buffer> set laststatus=2
