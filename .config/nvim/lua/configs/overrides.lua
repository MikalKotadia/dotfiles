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
    "yamlls",
    "vuels",
    "emmet_language_server"
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
