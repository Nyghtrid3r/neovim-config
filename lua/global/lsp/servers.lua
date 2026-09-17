return {
    clangd = {},
    cmake = {},

    jsonls = {},

    lua_ls = {
        settings = {
            Lua = {
                completion = {
                    callSnippet = 'Replace',
                },
                runtime = {
                    version = 'LuaJIT',
                },
                workspace = {
                    checkThirdParty = false,
                    library = vim.api.nvim_get_runtime_file('', true),
                },
                diagnostics = {
                    globals = { 'vim' },
                    disable = { 'missing-fields' },
                },
                format = {
                    enable = false,
                },
            },
        },
    },
}
