return {
    'nvim-treesitter/nvim-treesitter',

    lazy = false,
    build = ':TSUpdate',

    config = function()
        local treesitter = require 'nvim-treesitter'

        local parsers = {
            -- C / C++
            'c',
            'cpp',
            'cmake',

            -- JVM / Android / Jenkins
            'kotlin',
            'java',
            'groovy',

            -- Neovim
            'lua',
            'vim',
            'vimdoc',

            -- Shell
            'bash',
            'fish',

            -- Config / data
            'json',
            'toml',
            'yaml',

            -- Documentation
            'markdown',
            'markdown_inline',
        }

        -- Install missing parsers.
        -- This is a no-op for parsers that are already installed.
        treesitter.install(parsers)

        -- Enable Tree-sitter highlighting whenever a parser exists
        -- for the current filetype.
        vim.api.nvim_create_autocmd('FileType', {
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end,
}
