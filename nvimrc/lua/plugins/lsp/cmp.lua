return {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    config = function()
        local luasnip = require("luasnip")

        local cmp = require("cmp")

        cmp.setup({
            sorting = {
                comparators = {
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.recently_used,
                    require("clangd_extensions.cmp_scores"),
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },

            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ['<C-B>'] = cmp.mapping.scroll_docs(-4),
                ['<C-F>'] = cmp.mapping.scroll_docs(4),

                ['<C-Space>'] = cmp.mapping.complete(),

                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },

                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),

                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),

            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'nvim_lsp_signature_help' }
            },
        })

        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local ts_utils = require("nvim-treesitter.ts_utils")

        local ts_node_func_parens_disabled = {
            named_imports = true,
            use_declaration = true,
        }

        local default_handler = cmp_autopairs.filetypes["*"]["("].handler
        cmp_autopairs.filetypes["*"]["("].handler = function(char, item, bufnr, rules, commit_character)
            local node_type = ts_utils.get_node_at_cursor():type()
            if ts_node_func_parens_disabled[node_type] then
                if item.data then
                    item.data.funcParensDisabled = true
                else
                    char = ""
                end
            end
            default_handler(char, item, bufnr, rules, commit_character)
        end

        cmp.event:on(
            "confirm_done",
            cmp_autopairs.on_confirm_done({
                sh = false,
            })
        )
    end
}
