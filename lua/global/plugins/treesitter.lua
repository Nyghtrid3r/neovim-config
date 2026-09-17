return {
    'nvim-treesitter/nvim-treesitter',

    lazy = false,
    build = ':TSUpdate',

    config = function()
        local treesitter = require 'nvim-treesitter'

        local parsers = require 'global.treesitter.parsers'

        local ok, local_parsers = pcall(require, 'local.treesitter.parsers')

        if ok then
            vim.list_extend(parsers, local_parsers)
        end

        require('nvim-treesitter').install(parsers)

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
