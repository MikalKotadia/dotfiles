local M = {}

M.mason = {
    ensure_installed = {
        "astro-language-server",
        "typescript-language-server",
        "tailwindcss-language-server",
    },
}

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
    html = { filetypes = { "html", "twig", "astro" } },
    emmet_language_server = { filetypes = { "html", "twig", "astro" } },
    cssls = {
        settings = {
            css = {
                lint = {
                    unknownAtRules = "ignore",
                },
            },
            scss = {
                lint = {
                    unknownAtRules = "ignore",
                },
            },
            less = {
                lint = {
                    unknownAtRules = "ignore",
                },
            },
        },
    },
    ts_ls = {
        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
        root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
    },
    clangd = {},
    basedpyright = {
        root_markers = { "pyrightconfig.json", "pyproject.toml", ".git" },
        on_attach = function(client, _)
            client.server_capabilities.semanticTokensProvider = nil
        end,
    },
    astro = {
        filetypes = { "astro" },
        root_markers = { "astro.config.mjs", "astro.config.ts", "package.json", ".git" },
    },
    tailwindcss = {
        filetypes = { "astro", "css", "scss", "sass", "html", "javascriptreact", "typescriptreact", "vue", "svelte", "twig" },
        root_markers = {
            "tailwind.config.js",
            "tailwind.config.cjs",
            "tailwind.config.mjs",
            "tailwind.config.ts",
            "postcss.config.js",
            "postcss.config.cjs",
            "postcss.config.mjs",
            "postcss.config.ts",
            "package.json",
            ".git",
        },
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
