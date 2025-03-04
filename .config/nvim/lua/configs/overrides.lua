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
        -- disable = {
        --   "python"
        -- },
    },
}

M.mason = {
    ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "eslint_d",
        "intelephense",
        "prettier",
        "twiggy-language-server",

        -- c/cpp stuff
        "clangd",
        "clang-format",

        -- misc
        "ast-grep",
        "jdtls",
        "texlab",

        -- python
        "pylint",
        "pyright",
        -- java
        "jdtls",
        "json-lsp",

        "dockerfile-language-server",
        "gopls",
        "lemminx",
        "yaml-language-server",
    },
}

M.lsp_servers = {
    "html",
    "cssls",
    "ts_ls",
    "clangd",
    "pyright",
    "marksman",
    "texlab",
    "intelephense",
    "jdtls",
    "dockerls",
    "gopls",
    "jsonls",
    "lemminx",
    "twiggy_language_server",
    "bashls",
    "yamlls"
}

M.formatters = {
    formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { { "autopep8" } },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "eslint_d" } },
        typescript = { { "eslint_d" } },
        javascriptreact = { { "eslint_d" } },
        typescriptreact = { { "eslint_d" } },
    },
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
