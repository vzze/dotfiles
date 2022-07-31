:set number
:set relativenumber
:set autoindent
:set expandtab
:set tabstop=8
:set shiftwidth=4
:set smarttab
:set softtabstop=1
:set mouse=a
:set encoding=UTF-8
:set clipboard+=unnamedplus
:set signcolumn=yes
:set completeopt-=preview

call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'vim-airline/vim-airline'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'neoclide/coc.nvim'
Plug 'terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'folke/zen-mode.nvim'
Plug 'tpope/vim-surround'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'goolord/alpha-nvim'
Plug 'tpope/vim-repeat'
Plug 'lewis6991/impatient.nvim'
Plug 'max-0406/autoclose.nvim'
Plug 'mcauley-penney/tidy.nvim'

call plug#end()

lua << EOF
    require("impatient")

    require("tidy").setup()

    require("zen-mode").setup {
        window = {
            backdrop = 1,
            width = 1,
            height = 1
        },
    }

    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
         [[    `-'`                                ~;    ]],
         [[     ~~~-`                           'x#@x    ]],
         [[$####x~~~~;&###########W###########8NW@@#&###$]],
         [[%%<ua8x"~~~~;a88888888$#&88888888NN#@@@$a8&a&%]],
         [[%@+~~"*au"~~~~oN888888$W8888888&o%@@@$NNN8%W&%]],
         [[%@&*~~~~:uo:~"<~+N8888$W88888&N%*$@8aa8#@@Wo@%]],
         [[%#&8u"~~~~~+x<+~~~<N88$W888&N%@@*aaN$@@@@%a&@%]],
         [[%x~:<**;~~~~*<x+~~~~<N$W8&N%@@#&ax*@@@@8aa&8&x]],
         [[%@u~~~~:++:~+~~;o*"~~~+8o$@@%&a&#Nx@$No8#@@%8%]],
         [[%#NN;~~~~~+u*<~~~:ou";a$+W$Na&W@@ooxa$@@@@&a@%]],
         [[%#~;*u*;~~~+~+*;~~~+&#@&uNa&W@W8xNN*#@@$&x&&o%]],
         [[%@o"~~~:<;;:<~~:++o#@@$Nao8@#&o8#@oa$ax8$@@8$%]],
         [[%@NN;~~~~~*;*<~~~<#@%aa8W*Naa$@@#xuuxW@@@WNa@%]],
         [[%W88$&+~~~:<~~<+;*WN&8W@NNa%@W8aN$Wo8@@#&&##@%]],
         [[%W;~~";**+:<:~~~"uaN#@$aau&%Nx8W@@ax%8aa&$%$x%]],
         [[%@&o"~~~~~<oo+"~~a8@%aa%%uox%@@@%&xoa$W@@@$x@%]],
         [[%@&88o<~~~~*~"+u*x#Nx%@8o&uN@$&xN8&uW@@W$N&&@%]],
         [[%@&+"";<<<<;<~~~"uo8@8x8#N*&x&8W@Woa$NxN88&u@%]],
         [[%@&8x:~~~~~ouu+:~oW%xN##&axNW@@%8aox$W@@@8N&@%]],
         [[%@&888x<~~~:<~:+ooNx%$NN&Nu%8&xN8$o&@@#8N88&@%]],
         [[%@&8x"~:<<<;+<~~~u8$xN$@8axa&$W@Wxu8axN8$xN&@%]],
         [[%@&888u"~~~~<*;;+uo&#$$NNuo@@%$Nxxa%@@@$N88&@%]],
         [[%@&8888xou*;"+"~<o8&x&8#a*Nxx&$W8u%$8&aa888&@%]],
         [[%@&8888&<~~:++a+uo&$%$&xoN%@W$$NaoN8$$a&888&@%]],
         [[&@#%88888a*:~~;<o8NxN$8xu8axa88*a@@$&N8888$#@&]],
         [[ `:o$W#$8xuuu*<ua$%$8axN&$W@%8x*xxxNNN$#W$x;' ]],
         [[     ':o$W8u~~<o&xN8$8uxNaaNx*&@@@#$$$x;'     ]],
         [[         ';x$&N8%#$8&NxN&88NoxxxxNu;'         ]],
         [[            -ox*N#%$88$W&8$%W%*..-'           ]],
         [[          `.'    .<a%WW@W#a<.      ```        ]]
    }

    dashboard.section.buttons.val = {
        dashboard.button("e", "New File", ":ene <BAR> startinsert <CR>"),
        dashboard.button("SPC f f", "Find File"),
        dashboard.button("SPC f g", "Find Word"),
        dashboard.button("SPC c", "Config", ":e ~/Appdata/Local/nvim/init.vim <CR>")
    }

    require("alpha").setup(dashboard.config)
EOF

nnoremap <C-f> :NERDTreeToggle <Bar> :NERDTreeRefreshRoot<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F4> :ZenMode<CR>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

nnoremap tn :tabnew<CR>
nnoremap td :tabclose<CR>

nnoremap src :CocCommand clangd.switchSourceHeader<CR>

nnoremap git :CocCommand git.browserOpen<CR>
nnoremap gtc :CocCommand git.chunkInfo<CR>

nnoremap term :terminal Powershell.exe<CR>
nnoremap ttn :tabnew <Bar> :terminal Powershell.exe<CR>
tnoremap <Esc> <C-\><C-n>

inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#_select_confirm() :
            \ coc#expandableOrJumpable() ?
            \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

function! ShowDocs()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

nnoremap <silent> K :call ShowDocs() <CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

let g:python3_host_prog="C:/Users/Edi/scoop/apps/python/current/python.exe"
let g:python_host_prog="C:/Users/Edi/scoop/apps/python/current/python.exe"
let g:loaded_perl_provider=0
let g:loaded_ruby_provider=0

let g:airline_theme='purify'

:colorscheme default

autocmd vimenter * hi SignColumn ctermbg=NONE
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
autocmd vimenter * hi DiffAdd ctermbg=NONE guibg=NONE
autocmd vimenter * hi Pmenu guibg=NONE ctermbg=NONE ctermfg=3 guifg=3
autocmd vimenter * hi CursorLineNr cterm=NONE
autocmd vimenter * hi CursorLine cterm=NONE ctermbg=NONE ctermfg=121 guifg=121
autocmd vimenter * hi Type cterm=italic ctermfg=121 gui=italic guifg=121
autocmd vimenter * hi Keyword cterm=italic ctermfg=11 gui=italic guifg=11
autocmd vimenter * hi PreProc cterm=italic ctermfg=12 gui=italic guifg=12
autocmd vimenter * hi CocWarningSign ctermfg=3 guifg=3

autocmd vimenter * TSEnable highlight

" disables auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
autocmd User AlphaReady set laststatus=0 | autocmd BufUnload <buffer> set laststatus=2

function! s:high()
    :TSToggle highlight
endfunction

command -nargs=0 High call s:high()

function! Multiple_cursors_before()
    if exists(':CocDisable')==2
        exe 'CocDisable'
    endif
endfunction

function! Multiple_cursors_after()
    if exists(':CocEnable')==2
        exe 'CocEnable'
    endif
endfunction

function! s:update_git_status()
    let g:airline_section_b="%{get(g:,'coc_git_status','')}"
endfunction

let g:airline_section_b = "%{get(g:,'coc_git_status','')}"

autocmd User CocGitStatusChange call s:update_git_status()

" TSInstall all
" CocInstall coc-discord-rpc
" CocInstall coc-git
" CocInstall coc-python needs jedi
" CocInstall coc-clangd also setup path
" CocInstall coc-pairs
" CocInstall coc-json this and tsserver just work
" CocInstall coc-tsserver
" CocInstall coc-powershell
" pip3 install jedi
" scoop install universal-ctags
