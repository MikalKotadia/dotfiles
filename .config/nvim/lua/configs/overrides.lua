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

        "dockerfile-language-server",
        "gopls",
    },
}

M.lsp_servers = {
    "html",
    "cssls",
    "tsserver",
    "clangd",
    "pyright",
    "marksman",
    "texlab",
    "intelephense",
    "jdtls",
    "dockerls",
    "gopls",
}

M.formatters = {
    formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
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
