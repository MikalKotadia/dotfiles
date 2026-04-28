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

M.conform = {
    formatters_by_ft = {
        -- lua = { "stylua" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        python = { "ruff_organize_imports", "ruff_format" },
    },
    formatters = {
        ruff_format = {
            command = "uvx",
            args = { "ruff", "format", "--stdin-filename", "$FILENAME", "-" },
            stdin = true,
        },
        ruff_organize_imports = {
            command = "uvx",
            args = { "ruff", "check", "--select", "I", "--fix", "--stdin-filename", "$FILENAME", "-" },
            stdin = true,
        },
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
