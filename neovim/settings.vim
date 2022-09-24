:set number
:set noruler
:set relativenumber
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
:set nobackup
:set hlsearch
:set nowritebackup
:set updatetime=300
:set timeoutlen=500
:set fillchars+=vert:\ " Whitespace at the end

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : CheckBackSpace() ? "\<Tab>" : coc#refresh()
inoremap <silent><expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

:colorscheme default
