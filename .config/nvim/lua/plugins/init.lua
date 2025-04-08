local overrides = require "configs.overrides"

---@type NvPluginSpec[]
local plugins = {
    {
        "stevearc/conform.nvim",
        lazy = true,
        ft = vim.tbl_keys(overrides.linters_by_ft),
        opts = {
            formatters_by_ft = overrides.linters_by_ft,
        },
    },

    {
        "mfussenegger/nvim-lint",
        lazy = true,
        ft = vim.tbl_keys(overrides.linters_by_ft),
        config = function()
            local lint = require("lint")

            -- Use shared linters
            lint.linters_by_ft = overrides.linters_by_ft

            -- Auto-run linting on save & text change
            vim.api.nvim_create_autocmd({ "BufWritePost", "TextChanged", "InsertLeave" }, {
                callback = function()
                    lint.try_lint()
                end,
            })
        end,
    },

    -- override plugin configs
    {
        "williamboman/mason.nvim",
        opts = overrides.mason,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = overrides.treesitter,
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = overrides.nvimtree,
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require('nvchad.configs.lspconfig').defaults()
            require "configs.lspconfig"
        end,
    },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup {
                -- Configuration here, or leave empty to use defaults
            }
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
            require("ts_context_commentstring").setup {
                enable_autocmd = false,
            }
        end,
    },
    {
        "numToStr/Comment.nvim",
        lazy = false,
        config = function()
            require("Comment").setup {
                -- pre_hook = function()
                --     return vim.bo.commentstring
                -- end,
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            }
        end,
    },
    {
        "folke/todo-comments.nvim",
        lazy = false,
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        'Exafunction/codeium.vim',
        event = 'BufEnter',
        config = function()
            -- Change '<C-g>' here to any keycode you like.
            vim.g.codeium_disable_bindings = 1
            vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
            vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end,
                { expr = true, silent = true })
            vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
                { expr = true, silent = true })
            vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
        end
    },
    {
        'nvim-flutter/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        config = true
    },
    {
        "nvim-telescope/telescope.nvim",
        config = function()
            local config = require('nvchad.configs.telescope')
            local actions = require('telescope.actions')
            config.defaults.mappings["i"] = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            }
            require('telescope').setup(config)
        end
    },
}

return plugins
