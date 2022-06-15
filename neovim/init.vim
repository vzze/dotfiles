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
Plug 'mhinz/vim-startify'
Plug 'renerocksai/calendar-vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'folke/zen-mode.nvim'

call plug#end()

lua << EOF
    require("zen-mode").setup {
        window = {
            backdrop = 1,
            width = 1,
            height = 1
        },
    }
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

nnoremap cal :CalendarH<CR>

nnoremap term :terminal Powershell.exe<CR>
nnoremap ttn :tabnew <Bar> :terminal Powershell.exe<CR>
tnoremap <Esc> <C-\><C-n>

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

let g:python3_host_prog="C:/Users/Edi/scoop/apps/python/current/python.exe"
let g:python_host_prog="C:/Users/Edi/scoop/apps/python/current/python.exe"
let g:loaded_perl_provider=0
let g:loaded_ruby_provider=0

let g:startify_custom_header = [
            \ '                                    ',
            \ '              @99o..                ',
            \ '              `99   o               ',
            \ '               99.aad9.             ',
            \ '        "bad9999999999P             ',
            \ '               99                   ',
            \ '             od99o.                 ',
            \ '            99 99 9o        .o      ',
            \ '            `9999999     ,// `a     ',
            \ "          .ooP`99P'   .o%    ,@9.   ",
            \ '       .''       .oaadObooooa9999   ',
            \ "   . ~  .oad999999999999999999P'    ",
            \ "  \"soo999999999999999P\"'            ",
            \ '       ,.oaa99aooo.                 ',
            \ '     .  ,o9999999999.   o@@o        ',
            \ "     o o99'        `99   @@@        ",
            \ "     `99'       ,oda9'   \"'         ",
            \ '               0   a999o.           ',
            \ '               `.ao" `999,          ',
            \ '                      `999;         ',
            \ '                       999          ',
            \ "         o            ,99'          ",
            \ '          `9a,       ,9F            ',
            \ '            "*bo. ,g9"              ',
            \ ]

let g:airline_theme='purify'

:colorscheme default

autocmd vimenter * hi SignColumn ctermbg=NONE
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
autocmd vimenter * hi DiffAdd ctermbg=NONE guibg=NONE
autocmd vimenter * hi Pmenu guibg=NONE ctermbg=NONE ctermfg=3 guifg=3
autocmd vimenter * hi CursorLineNr cterm=NONE
autocmd vimenter * hi CursorLine NONE
autocmd vimenter * hi Type cterm=italic ctermfg=121 gui=italic guifg=#60ff60
autocmd vimenter * hi Keyword cterm=italic ctermfg=11 gui=italic guifg=11

autocmd vimenter * TSUpdateSync
autocmd vimenter * TSEnable highlight

" disables auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

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
