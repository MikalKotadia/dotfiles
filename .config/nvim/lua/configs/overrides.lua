local M = {}

M.treesitter = {
    ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "markdown",
        "markdown_inline",
        "python",
        "java",
        "php",
        "go",
        "json",
        "twig",
        "yaml",
    },
    indent = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
                ["ai"] = "@conditional.outer",
                ["ii"] = "@conditional.inner",
            },
            -- You can choose the select mode (default is charwise 'v')
            selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V', -- linewise
                ['@class.outer'] = 'V', -- linewise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace.
            include_surrounding_whitespace = false,
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]f"] = "@function.outer",
                ["]c"] = "@class.outer",
                ["]a"] = "@parameter.inner",
            },
            goto_next_end = {
                ["]F"] = "@function.outer",
                ["]C"] = "@class.outer",
                ["]A"] = "@parameter.inner",
            },
            goto_previous_start = {
                ["[f"] = "@function.outer",
                ["[c"] = "@class.outer",
                ["[a"] = "@parameter.inner",
            },
            goto_previous_end = {
                ["[F"] = "@function.outer",
                ["[C"] = "@class.outer",
                ["[A"] = "@parameter.inner",
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>sn"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>sp"] = "@parameter.inner",
            },
        },
        lsp_interop = {
            enable = true,
            border = 'rounded',
            floating_preview_opts = {},
            peek_definition_code = {
                ["<leader>pf"] = "@function.outer",
                ["<leader>pc"] = "@class.outer",
            },
        },
    },
}

M.lsp_servers = {
    html = { filetypes = { "html", "twig" } },
    emmet_language_server = { filetypes = { "html", "twig" } },
    cssls = {},
    ts_ls = {},
    clangd = {},
    basedpyright = {
        root_markers = { "pyrightconfig.json", "pyproject.toml", ".git" },
        on_attach = function(client, _)
            client.server_capabilities.semanticTokensProvider = nil
        end,
    },
    marksman = {},
    texlab = {},
    intelephense = {},
    jdtls = {},
    dockerls = {},
    gopls = {},
    jsonls = {},
    lemminx = {},
    twiggy_language_server = {},
    bashls = {},
    yamlls = {},
    vuels = {},
}

M.linters_by_ft = {
        -- lua = { "stylua" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        python = { "ruff" },
}

-- git support in nvimtree
M.nvimtree = {
    git = {
        enable = true,
    },

    renderer = {
        highlight_git = true,
        icons = {
            show = {
                git = true,
            },
        },
    },
}

return M
