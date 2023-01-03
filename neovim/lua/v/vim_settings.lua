V.vim_settings = {
    number = true,
    relativenumber = true,
    expandtab = true,
    tabstop = 8,
    shiftwidth = 4,
    smarttab = true,
    softtabstop = 1,
    mouse = 'a',
    encoding = "UTF-8",
    clipboard = vim.o.clipboard .. "unnamedplus",
    signcolumn = "yes",
    completeopt = { "menu", "preview" },
    hlsearch = true,
    updatetime = 300,
    timeoutlen = 500,
    backup = false,
    ruler = false,
    writebackup = false,
    fillchars = {
        stl = ' ', stlnc = ' ', vert = ' '
    },
    cmdheight = 0,
    sessionoptions = {
        "blank", "buffers", "curdir", "folds", "help", "tabpages", "winsize", "winpos", "terminal"
    },
    foldmethod = "indent",
    foldlevelstart = -1,
    foldcolumn = "1",
    laststatus = 1,
    hidden = false
}
