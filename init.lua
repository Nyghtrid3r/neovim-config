-- Global core config
require 'global.core.options'
require 'global.core.keymaps'
require 'global.core.snippets'

-- Optional machine-local core config
pcall(require, 'local.core.options')
pcall(require, 'local.core.keymaps')
pcall(require, 'local.core.snippets')

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'

    local out = vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        '--branch=stable',
        lazyrepo,
        lazypath,
    }

    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end

vim.opt.rtp:prepend(lazypath)

-- Plugin specs
local plugins = {
    { import = 'global.plugins' },
}

local local_plugins = vim.fn.stdpath 'config' .. '/lua/local/plugins'

local local_plugin_files = vim.fn.glob(local_plugins .. '/*.lua', false, true)

if #local_plugin_files > 0 then
    table.insert(plugins, {
        import = 'local.plugins',
    })
end

require('lazy').setup(plugins)
-- vim: ts=4 sts=4 sw=4 et
