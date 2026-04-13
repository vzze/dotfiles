V.mappings.global = {
    { "<LocalLeader>", group = "V1602" },
    { "<Leader>"     , group = "V1602" },

    { "<Leader>m" , "<cmd>Mason<CR>"                              , desc = "Open Mason"          },
    { "<Leader>p" , "<cmd>Lazy<CR>"                               , desc = "Open Plugin Manager" },
    { "<Leader>r" , "<cmd>lua require(\"persistence\").load()<cr>", desc = "Restore Session"     },

    { "<Leader>t" , group = "Tabs" },

    { "<Leader>tq", "<cmd>tabclose<CR>"          , desc = "Close Tab"          },
    { "<Leader>tf", "<cmd>Neotree toggle top<CR>", desc = "Toggle File Editor" },
    { "<Leader>th", "<cmd>tabprevious<CR>"       , desc = "Previous Tab"       },
    { "<Leader>tl", "<cmd>tabnext<CR>"           , desc = "Next Tab"           },
    { "<Leader>tn", "<cmd>tabnew<CR>"            , desc = "New Tab"            },

    { "<Leader>w" , group = "Windows" },

    { "<Leader>wq", "<cmd>wincmd q<CR>" , desc = "Close Window"         },
    { "<Leader>wv", "<cmd>wincmd v<CR>" , desc = "Vertical Split"       },
    { "<Leader>ws", "<cmd>wincmd s<CR>" , desc = "Horizontal Split"     },
    { "<Leader>ww", "<cmd>wincmd w<CR>" , desc = "Cycle Windows"        },

    { "<Leader>wu", "<cmd>wincmd _<CR>" , desc = "Max Out Height"       },
    { "<Leader>wi", "<cmd>wincmd |<CR>" , desc = "Max Out Width"        },
    { "<Leader>wp", "<cmd>wincmd =<CR>" , desc = "Equalize Splits"      },
    { "<Leader>wt", "<cmd>wincmd T<CR>" , desc = "Move to New Tab"      },

    { "<Leader>wh", "<cmd>wincmd h<CR>" , desc = "Move to Left Split"   },
    { "<Leader>wj", "<cmd>wincmd j<CR>" , desc = "Move to Bottom Split" },
    { "<Leader>wk", "<cmd>wincmd k<CR>" , desc = "Move to Top Split"    },
    { "<Leader>wl", "<cmd>wincmd l<CR>" , desc = "Move to Right Split"  },

    { "<Leader>wH", "<cmd>wincmd 6<<CR>", desc = "Decrease Width"       },
    { "<Leader>wJ", "<cmd>wincmd 4-<CR>", desc = "Decrease Height"      },
    { "<Leader>wK", "<cmd>wincmd 4+<CR>", desc = "Increase Height"      },
    { "<Leader>wL", "<cmd>wincmd 6><CR>", desc = "Increase Width"       },

    { "<Leader>s" , group = "Search" },

    { "<Leader>sb", "<cmd>Telescope buffers<CR>"                  , desc = "Find Buffers" },
    { "<Leader>sf", "<cmd>Telescope find_files<CR>"               , desc = "Find Files"   },
    { "<Leader>sg", "<cmd>Telescope live_grep<CR>"                , desc = "Grep Time"    },
    { "<Leader>sh", "<cmd>Telescope help_tags<CR>"                , desc = "Help Tags"    },
    { "<Leader>ss", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Fuzzy Find"   },
    { "<Leader>st", "<cmd>Telescope builtin<CR>"                  , desc = "Telescope"    },

    { "<Leader>u" , group = "Update" },

    { "<Leader>um", "<cmd>MasonUpdate<CR>" , desc = "Mason"      },
    { "<Leader>up", "<cmd>Lazy sync<CR>"   , desc = "Plugins"    },

    { "q"    , "<Plug>(leap-forward)" , desc = "Leap Forward"  },
    { "Q"    , "<Plug>(leap-backward)", desc = "Leap Backward" },

    { "<Esc>", "\28\14", desc = "Terminal Escape", mode = "t" }
}
