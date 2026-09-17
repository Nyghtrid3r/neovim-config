return {
    'Civitasv/cmake-tools.nvim',

    opts = {
        cmake_use_preset = true,

        -- Don't regenerate automatically every time you save.
        cmake_regenerate_on_save = false,

        cmake_generate_options = {
            '-DCMAKE_EXPORT_COMPILE_COMMANDS=1',
            '-DCOMPILER_ARCH_SELECTION=u20_x86_64',
            '-DCMAKE_POLICY_VERSION_MINIMUM=3.5',
        },

        -- Debug / Release / RelWithDebInfo etc. each get their own directory.
        cmake_build_directory = 'build/${variant:buildType}',

        -- Put a symlink at:y
        --
        --     build/compile_commands.json
        --
        -- pointing to the active build type's compile_commands.json.
        --
        -- clangd reliably discovers build/compile_commands.json.
        cmake_compile_commands_options = {
            action = 'soft_link',
            target = vim.loop.cwd() .. '/build',
        },
    },

    keys = {
        {
            '<leader>cg',
            '<cmd>CMakeGenerate<cr>',
            desc = 'Generate CMake',
        },

        {
            '<leader>cb',
            '<cmd>CMakeBuild<cr>',
            desc = 'Build CMake',
        },

        {
            '<leader>ct',
            '<cmd>CMakeSelectBuildType<cr>',
            desc = 'Select Build Type',
        },

        {
            '<leader>cT',
            '<cmd>CMakeSelectBuildTarget<cr>',
            desc = 'Select Build Target',
        },

        {
            '<leader>cB',
            '<cmd>CMakeQuickBuild<cr>',
            desc = 'Quick Build Target',
        },
    },
}
