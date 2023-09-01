return {
    "p00f/clangd_extensions.nvim",
    config = function()
        require("clangd_extensions").setup({
            inlay_hints = {
                inline = vim.fn.has("nvim-0.10") == 1,
                only_current_line = false,
                only_current_line_autocmd = { "CursorHold" },
                show_parameter_hints = true,
                parameter_hints_prefix = "<- ",
                other_hints_prefix = "=> ",
                max_len_align = false,
                max_len_align_padding = 1,
                right_align = false,
                right_align_padding = 7,
                highlight = "MatchParen",
                priority = 100,
            },

            ast = {
                role_icons = {
                    type = "T",
                    declaration = "D",
                    expression = "E",
                    statement = ";",
                    specifier = "S",
                    ["template argument"] = "t",
                },

                kind_icons = {
                    Compound = "C",
                    Recovery = "R",
                    TranslationUnit = "U",
                    PackExpansion = "P",
                    TemplateTypeParm = "t",
                    TemplateTemplateParm = "t",
                    TemplateParamObject = "t"
                },

                highlights = { detail = "MatchParen" }
            },

            memory_usage = { border = "none" },
            symbol_info  = { border = "none" }
        });
    end
}
