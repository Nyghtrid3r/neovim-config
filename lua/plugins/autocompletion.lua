return {
    'saghen/blink.cmp',

    dependencies = {
        'saghen/blink.lib',

        {
            'L3MON4D3/LuaSnip',
            build = (function()
            if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                return
                end
                return 'make install_jsregexp'
            end)(),

            dependencies = {
                {
                    'rafamadriz/friendly-snippets',
                    config = function()
                    require('luasnip.loaders.from_vscode').lazy_load()
                    end,
                },
            },
        },
    },

    build = function()
    require('blink.cmp').build():pwait()
    end,

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        snippets = {
            preset = 'luasnip',
        },

        keymap = {
            preset = 'default',

            -- Keep your old nvim-cmp Tab behavior:
            -- Tab selects next completion, otherwise jumps through snippets.
            ['<Tab>'] = {
                'select_next',
                'snippet_forward',
                'fallback',
            },

            ['<S-Tab>'] = {
                'select_prev',
                'snippet_backward',
                'fallback',
            },
        },

        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 300,
            },

            -- Optional preview of the currently selected completion
            ghost_text = {
                enabled = true,
            },
        },

        signature = {
            enabled = true,
        },

        sources = {
            default = {
                'lsp',
                'path',
                'snippets',
                'buffer',
            },
        },

        fuzzy = {
            implementation = 'rust',
        },
    },

    opts_extend = {
        'sources.default',
    },
}
