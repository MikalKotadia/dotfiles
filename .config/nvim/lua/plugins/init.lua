local overrides = require "configs.overrides"

---@type NvPluginSpec[]
local plugins = {

    -- Override plugin definition options

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- format & linting
            {
                "jose-elias-alvarez/null-ls.nvim",
                config = function()
                    require "configs.null-ls"
                end,
            },
        },
        config = function()
            require('nvchad.configs.lspconfig').defaults()
            require "configs.lspconfig"
        end, -- Override to setup mason-lspconfig
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

    -- In order to modify the `lspconfig` configuration:
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
        "robitx/gp.nvim",
        event = "VeryLazy",
        config = function()
            require("gp").setup {
                -- update both branches to use bw
                openai_api_key = { "op", "item", "get", "chatgpt", "--fields", "credential" },
                providers = {
                    googleai = {
                        disable = false,
                        endpoint = "https://generativelanguage.googleapis.com/v1beta/models/{{model}}:streamGenerateContent?key={{secret}}",
                        secret = { "op", "item", "get", "gemini", "--fields", "credential" },
                    },
                },
                agents = {
                    {
                        name = "ChatGPT3-5",
                        disable = true,
                    },
                    {
                        provider = "openai",
                        name = "ChatGPT4o-mini",
                        chat = true,
                        command = true,
                        model = { model = "gpt-4o-mini", temperature = 1.1, top_p = 1 },
                        system_prompt = require("gp.defaults").chat_system_prompt,
                    },
                    {
                        provider = "googleai",
                        name = "ChatGemini",
                        chat = true,
                        command = true,
                        disable = false,
                        model = { model = "gemini-pro", temperature = 1.1, top_p = 1 },
                        -- system prompt (use this to specify the persona/role of the AI)
                        system_prompt = require("gp.defaults").chat_system_prompt,
                    },
                },
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
}

return plugins
